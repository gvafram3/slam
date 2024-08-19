const mongoose = require("mongoose");
const birthInfoSchema = new mongoose.Schema({
  bYear: {
    type: Number,
    required: [true, "Please provide birth year"],
  },
  bMonth: {
    type: Number,
    required: [true, "Please provide month"],
  },
  bDay: {
    type: Number,
    required: [true, "Please provide day"],
  },
});

const BirthInfo = mongoose.model("BirthInfo", birthInfoSchema);
module.exports = BirthInfo;
