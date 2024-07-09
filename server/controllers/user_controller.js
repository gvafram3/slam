const User = require("../models/usermodel");
const Catchsync = require("../utils/catchsync");

// exports.createUser = (req, res) => {
//   const { username, password, hostel, lastLocation } = req.body;
// };

exports.getAllUser = Catchsync(async (req, res) => {
  const users = await User.find();

  res.status(200).json({
    status: "success",
    resultLength: users,
    data: {
      users,
    },
  });
});

exports.createUser = Catchsync((req, res) => {
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
  const newUser = new User({
    name,
    email,
    username,
    password,
    photo,
    gender,
    fatherName,
    motherName,
    referenceNumber,
    bDay,
    bMonth,
    bYear,
    descriptor,
    phoneNumber,
    homeTown,
    criminalRecords,
    role,
    otherRecords,
    shsAttended,
    currentHostel,
    birthCert,
    quideanContact: parentPhone,
  }).save();
});
