const mongoose = require("mongoose");
const validator = require("validator");
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, "Please name is required field"],
  },
  email: {
    type: String,
    required: [true, "Please provide your email"],
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, "Please check the email and try again"],
  },
  username: {
    type: String,
    required: [true, "Please username is required"],
    unique: true,
  },
  password: {
    type: String,
    required: [true, "Please password is a required"],
    minlegth: 8,
    select: false,
  },
  currentHostel: {
    type: String,
  },
  photo: {
    type: String,
    required: [true, "Please photo of user is a required field"],
  },
  phoneNumber: {
    type: Number,
    required: [true, "Please a user must have password"],
  },
  referenceNumber: {
    type: Number,
    required: [true, "Please refrence number is a required field"],
  },
  MotherName: {
    type: String,
  },
  fatherName: {
    type: String,
  },
  guideanContact: {
    type: Number,
  },
  gender: {
    type: String,
    enum: ["Male", "Female"],
    required: true,
  },
  bYear: {
    type: Number,
    required: [true, "Please provide birth year"],
  },
  bDay: {
    type: Number,
    required: [true, "Please provide day "],
  },
  bMonth: {
    type: Number,
    required: [true, "Please provide Month"],
  },
  birthCert: {
    type: String,
    required: [true, "Please a scanned copy of birth certificate is required"],
  },
  homeTown: {
    type: String,
  },
  criminalRecords: {
    type: String,
    default: "none",
  },
  shsAttended: {
    type: String,
    required: true,
  },
  role: {
    type: String,
    enum: ["student", "admin", "driver"],
    default: "student",
  },
  otherRecords: {
    type: String,
  },
  descriptor: {
    type: Buffer,
  },
});
const User = mongoose.model("User", userSchema);
module.exports = User;
