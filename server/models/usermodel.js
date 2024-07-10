const mongoose = require("mongoose");
const validator = require("validator");

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, "Name is a required field"],
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
    required: [true, "Username is required"],
    unique: true,
  },
  password: {
    type: String,
    required: [true, "Password is required"],
    minlength: 8,
    select: false,
  },
  currentHostel: {
    type: String,
    default: undefined,
  },
  photo: {
    type: String,
    required: [true, "Photo of user is a required field"],
  },
  phoneNumber: {
    type: String,
    required: [true, "Phone number is required"],
    validate: {
      validator: function (v) {
        return /\d{10,15}/.test(v);
      },
      message: (props) => `${props.value} is not a valid phone number!`,
    },
  },
  referenceNumber: {
    type: String,
    required: [true, "Reference number is a required field"],
  },
  motherName: {
    type: String,
    default: undefined,
  },
  fatherName: {
    type: String,
    default: undefined,
  },
  guideanContact: {
    type: String,
    default: undefined,
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
    required: [true, "Please provide day"],
  },
  bMonth: {
    type: Number,
    required: [true, "Please provide month"],
  },
  birthCert: {
    type: String,
    required: [true, "A scanned copy of birth certificate is required"],
  },
  homeTown: {
    type: String,
    default: undefined,
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
    default: undefined,
  },
  descriptor: {
    type: Buffer,
    required: true,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
