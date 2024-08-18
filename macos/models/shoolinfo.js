const mongoose = require("mongoose");

const schoolInfoSchema = new mongoose.Schema({
  shsAttended: {
    type: String,
    required: [true, "Please provide the Senior High School attended"],
  },

  otherRecords: {
    type: String,
    default: undefined,
  },
});

const SchoolInfo = mongoose.model("SchoolInfo", schoolInfoSchema);

module.exports = SchoolInfo;
