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
  gender: {
    type: String,
    enum: ["Male", "Female"],
    required: true,
  },
  birthInfo: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "BirthInfo",
    required: true,
  },
  locationInfo: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "LocationInfo",
  },
  contactInfo: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "ContactInfo",
  },
  role: {
    type: String,
    enum: ["student", "admin", "driver"],
    default: "student",
  },
  descriptor: {
    type: Buffer,
    required: true,
  },
  schoolInfo: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "SchoolInfo",
  },
});

const User = mongoose.model("User", userSchema);
