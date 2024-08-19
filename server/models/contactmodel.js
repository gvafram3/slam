const mongoose = require("mongoose");
const contactInfoSchema = new mongoose.Schema({
  fatherName: {
    type: String,
    default: undefined,
  },
  motherName: {
    type: String,
    default: undefined,
  },
  guideanContact: {
    type: String,
    default: undefined,
  },
  currentHostel: {
    type: String,
    default: undefined,
  },
});

const ContactInfo = mongoose.model("ContactInfo", contactInfoSchema);
module.exports = ContactInfo;
