const bcrypt = require("bcryptjs");
const User = require("../models/usermodel");
const SchoolInfo = require("../models/shoolinfo");
const LocationInfo = require("../models/locationmodel");
const ContactInfo = require("../models/contactmodel");
const BirthInfo = require("../models/birthmodel");
const faceapi = require("face-api.js");
const { loadImage, createCanvas } = require("canvas");
const path = require("path");
const fs = require("fs");
const catchAsync = require("../utils/catchsync");
const AppError = require("../utils/app_error");
const jwt = require("jsonwebtoken");
// const m = require('../models/ai')
const tf = require("@tensorflow/tfjs-node");

const loadModels = async () => {
  const modelPath = path.join(__dirname, "../models/ai");
  await faceapi.nets.ssdMobilenetv1.loadFromDisk(modelPath);
  await faceapi.nets.faceLandmark68Net.loadFromDisk(modelPath);
  await faceapi.nets.faceRecognitionNet.loadFromDisk(modelPath);
  await faceapi.nets.ageGenderNet.loadFromDisk(modelPath);
  console.log("modules loaded");
};

function decodeBase64ToFloat32Array(base64Str) {
  const binaryStr = Buffer.from(base64Str, "base64");
  const floatArray = new Float32Array(new Uint8Array(binaryStr).buffer);
  return floatArray;
}

exports.registerUser = async (req, res) => {
  try {
    const {
      name,
      email,
      username,
      password,
      phoneNumber,
      gender,
      referenceNumber,
      bYear,
      bMonth,
      bDay,
      shsAttended,
      otherRecords,
      lat,
      long,
      isOnline,
      trackingAllowed,
      fatherName,
      motherName,
      guideanContact,
      currentHostel,
      role,
    } = req.body;

    console.log(role, req.files.photo);
    if (!req.files || !req.files.photo) {
      return res.status(400).send("Photo is required");
    }
    await tf.setBackend("cpu");
    console.log("Backend set to:", tf.getBackend());

    const photo = req.files.photo;
    const photoPath = path.join(
      "public",
      "uploads",
      `${username}_photo_${Date.now()}.jpg`
    );
    await photo.mv(photoPath);

    await loadModels();

    const img = await loadImage(photoPath);
    console.log(img);
    console.log(img.width);
    const canvas = createCanvas(224, 224);
    const ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0, 224, 224);
    console.log("code was reached");
    console.log(canvas);
    const input = tf.browser.fromPixels(canvas);
    const detection = await faceapi
      .detectSingleFace(input)
      .withFaceLandmarks()
      .withFaceDescriptor()
      .withAgeAndGender();
    console.log(detection);
    if (!detection) {
      return res.status(400).send("No face detected in the photo");
    }
    console.log(detection);
    const detectedGender = detection.gender;
    if (detectedGender !== gender.toLowerCase()) {
      return res
        .status(400)
        .send(
          `Detected gender (${detectedGender}) does not match the provided gender (${gender})`
        );
    }

    const descriptor = detection.descriptor;
    // const descriptorBuffer = Buffer.from(descriptor);
    const descriptorBuffer = Buffer.from(new Float32Array(descriptor).buffer);
    // Hash the password before saving
    const hashedPassword = await bcrypt.hash(password, 12);

    const birthInfo = new BirthInfo({ bYear, bMonth, bDay });
    const schoolInfo = new SchoolInfo({ shsAttended, otherRecords });
    const locationInfo = new LocationInfo({
      currentLocation: lat && long ? { lat, long } : undefined,
      isOnline,
      trackingAllowed,
    });
    const contactInfo = new ContactInfo({
      fatherName,
      motherName,
      guideanContact,
      currentHostel,
    });

    // Save all related models and the user
    await Promise.all([
      birthInfo.save(),
      schoolInfo.save(),
      locationInfo.save(),
      contactInfo.save(),
    ]);

    const user = new User({
      name,
      email,
      username,
      password: hashedPassword,
      photo: photoPath,
      phoneNumber,
      referenceNumber,
      gender,
      birthInfo: birthInfo._id,
      locationInfo: locationInfo._id,
      contactInfo: contactInfo._id,
      role,
      descriptor: descriptorBuffer,
      schoolInfo: schoolInfo._id,
    });

    await user.save();

    res.status(201).send({ message: "User registered successfully", user });
  } catch (error) {
    console.error(error);

    // Cleanup the uploaded photo in case of an error
    if (req.files && req.files.photo) {
      const fs = require("fs");
      //   fs.unlinkSync(photoPath);
    }

    res.status(500).send("Error registering user");
  }
};

exports.findUserByImage = async (req, res) => {
  try {
    if (!req.files || !req.files.photo) {
      return res.status(400).send("Photo is required");
    }

    await loadModels();

    const photo = req.files.photo;
    const photoPath = path.join(
      "public",
      "uploads",
      `query_photo_${Date.now()}.jpg`
    );
    await photo.mv(photoPath);

    // const img = await faceapi.bufferToImage(fs.readFileSync(photoPath));
    // const canvas = faceapi.createCanvasFromMedia(img);
    // const ctx = canvas.getContext("2d");
    // ctx.drawImage(img, 0, 0, img.width, img.height);

    //
    await tf.setBackend("cpu");
    console.log("Backend set to:", tf.getBackend());
    // const backend = tf.backend();
    // console.log("Available functions on the backend:", Object.keys(backend));
    const img = await loadImage(photoPath);
    const c = createCanvas(224, 224);
    const ctx = c.getContext("2d");
    ctx.drawImage(img, 0, 0, 224, 224);
    // console.log(img);
    //
    const input = tf.browser.fromPixels(c);
    const detection = await faceapi
      .detectSingleFace(input)
      .withFaceLandmarks()
      .withFaceDescriptor()
      .withAgeAndGender();
    console.log(detection);
    if (!detection) {
      return res.status(400).send("No face detected in the photo");
    }

    // const queryDescriptor = detection.descriptor;
    const descriptor = detection.descriptor;
    // const descriptorBuffer = Buffer.from(descriptor);
    // const descriptorBuffer = Buffer.from(new Float32Array(descriptor).buffer);
    const queryDescriptor = Buffer.from(new Float32Array(descriptor).buffer);
    const users = await User.find().select("descriptor");

    let bestMatch = null;
    let bestDistance = Infinity;

    users.forEach((user) => {
      // const storedDescriptor = new Float32Array(user.descriptor.buffer);
      const storedDescriptor = decodeBase64ToFloat32Array(user.descriptor);
      console.log(storedDescriptor);
      const comparedDes = new Float32Array(queryDescriptor.buffer);
      console.log(comparedDes);
      // if (storedDescriptor.length !== comparedDes.length) {
      //   console.error(
      //     "Descriptor length mismatch:",
      //     storedDescriptor.length,
      //     comparedDes.length
      //   );
      //   return; // Skip this comparison if lengths don't match
      // }
      // console.log(descriptorBuffer);
      console.log(comparedDes.length, storedDescriptor.length);
      const distance = faceapi.euclideanDistance(storedDescriptor, comparedDes);
      console.log(distance);

      if (distance < bestDistance) {
        bestDistance = distance;
        bestMatch = user;
      }
    });
    console.log(bestDistance);
    if (bestMatch && bestDistance < 0.6) {
      // Adjust the threshold as needed
      const matchedUser = await User.findById(bestMatch._id);
      return res.status(200).json({ message: "User found", user: matchedUser });
    } else {
      return res.status(404).json({ message: "No matching user found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("Error finding user");
  } finally {
    // Cleanup the uploaded photo
    if (req.files && req.files.photo) {
      // fs.unlinkSync(photoPath);
    }
  }
};

// Middleware to check roles
const checkRole = (roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return next(
        new AppError("You do not have permission to perform this action", 403)
      );
    }
    next();
  };
};

// Create user

// Get all users (admin only)
exports.getAllUsers = [
  checkRole(["admin"]),
  catchAsync(async (req, res, next) => {
    const users = await User.find();
    res.status(200).json({
      status: "success",
      results: users.length,
      data: {
        users,
      },
    });
  }),
];

// Get single user by ID or name (admin only)
exports.getUser = [
  checkRole(["admin"]),
  catchAsync(async (req, res, next) => {
    const query = req.params.idOrName.match(/^[0-9a-fA-F]{24}$/)
      ? { _id: req.params.idOrName }
      : { name: req.params.idOrName };
    const user = await User.findOne(query);

    if (!user) {
      return next(new AppError("No user found with that ID or name", 404));
    }

    res.status(200).json({
      status: "success",
      data: {
        user,
      },
    });
  }),
];

// Update user (admin only)
exports.updateUser = [
  checkRole(["admin"]),
  catchAsync(async (req, res, next) => {
    const updatedUser = await User.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!updatedUser) {
      return next(new AppError("No user found with that ID", 404));
    }

    res.status(200).json({
      status: "success",
      data: {
        user: updatedUser,
      },
    });
  }),
];

// Delete user (admin only)
exports.deleteUser = [
  checkRole(["admin"]),
  catchAsync(async (req, res, next) => {
    const user = await User.findByIdAndDelete(req.params.id);
    if (!user) {
      return next(new AppError("No user found with that ID", 404));
    }
    res.status(204).json({
      status: "success",
      data: null,
    });
  }),
];

// User login
exports.login = catchAsync(async (req, res, next) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return next(new AppError("Please provide email and password", 400));
  }

  const user = await User.findOne({ email }).select("+password");
  if (!user || !(await bcrypt.compare(password, user.password))) {
    return next(new AppError("Incorrect email or password", 401));
  }

  const token = jwt.sign(
    { id: user._id, role: user.role },
    process.env.JWT_SECRET,
    {
      expiresIn: process.env.JWT_EXPIRES_IN,
    }
  );

  res.status(200).json({
    status: "success",
    token,
    data: {
      user,
    },
  });
});
