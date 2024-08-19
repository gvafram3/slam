const faceapi = require("face-api.js");
const canvas = require("canvas");
const path = require("path");

const { Canvas, Image, ImageData } = canvas;
faceapi.env.monkeyPatch({ Canvas, Image, ImageData });

const getDescriptorFromImage = async (imagePath) => {
  const image = await canvas.loadImage(path.resolve(__dirname, imagePath));
  const detection = await faceapi
    .detectSingleFace(image)
    .withFaceLandmarks()
    .withFaceDescriptor();

  if (!detection) {
    throw new Error("Could not detect face in the provided image");
  }

  return Buffer.from(detection.descriptor);
};

module.exports = {
  getDescriptorFromImage,
};
