const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const fileUpload = require("express-fileupload");
const path = require("path");
const adminRoute = require("./routes/adminRoute");
dotenv.config(); // Load environment variables

const app = express();

// Middleware to parse incoming JSON requests
app.use(express.json());

// Middleware to handle file uploads with a 100MB limit
app.use(
  fileUpload({
    limits: { fileSize: 100 * 1024 * 1024 }, // 100MB limit
    useTempFiles: true,
    tempFileDir: "/tmp/",
  })
);

// Middleware to serve static files (e.g., uploaded images)
app.use("/public", express.static(path.join(__dirname, "public")));

// Connect to MongoDB
mongoose
  .connect(process.env.MONGO_URI, {})
  .then(() => console.log("Connected to MongoDB"))
  .catch((err) => console.error("Failed to connect to MongoDB", err));

// Import your routes

// Use routes
app.use("/api", adminRoute);
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: "Internal Server Error" });
});
// Start the server
const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
