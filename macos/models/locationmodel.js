const mongoose = require("mongoose");

const locationInfoSchema = new mongoose.Schema({
  currentLocation: {
    type: {
      lat: { type: Number, required: true },
      long: { type: Number, required: true },
    },
    required: false,
  },
  pastLocations: [
    {
      type: {
        lat: { type: Number, required: true },
        long: { type: Number, required: true },
      },
      timestamp: { type: Date, default: Date.now },
    },
  ],
  isOnline: {
    type: Boolean,
    default: false,
  },
  trackingAllowed: {
    type: Boolean,
    default: false,
  },
});

const LocationInfo = mongoose.model("LocationInfo", locationInfoSchema);
