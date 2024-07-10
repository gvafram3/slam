const User = require("../models/usermodel");
const catchAsync = require("../utils/catchAsync");
const AppError = require("../utils/appError");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
// Assuming you use a library to generate descriptors
const { getDescriptorFromImage } = require("../utils/facialRecognitionUtils");

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
exports.createUser = catchAsync(async (req, res, next) => {
  const {
    name,
    username,
    phoneNumber,
    password,
    bYear,
    bDay,
    bMonth,
    gender,
    fatherName,
    motherName,
    parentPhone,
    referenceNumber,
    homeTown,
    criminalRecords,
    role,
    otherRecords,
    shsAttended,
    email,
    currentHostel,
    photo,
    birthCert,
  } = req.body;

  // Generate descriptor from the provided photo
  const descriptor = await getDescriptorFromImage(photo);

  const newUser = await User.create({
    name,
    username,
    phoneNumber,
    password,
    bYear,
    bDay,
    bMonth,
    gender,
    fatherName,
    motherName,
    guideanContact: parentPhone,
    referenceNumber,
    homeTown,
    criminalRecords,
    role,
    otherRecords,
    shsAttended,
    email,
    currentHostel,
    photo,
    birthCert,
    descriptor, // Add the descriptor to the new user object
  });

  res.status(201).json({
    status: "success",
    data: {
      user: newUser,
    },
  });
});

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
