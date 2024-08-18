const express = require("express");
const adminController = require("../controllers/adminController");
const { protect } = require("./../controllers/auth"); // Assuming you have an authController for handling authentication
const router = express.Router();

// Protect all routes after this middleware
// router.use(protect);

router
  .route("/admin")
  .get(adminController.getAllUsers)
  .post(adminController.registerUser);

router.route("/:idOrName").get(adminController.getUser);

module.exports = router;
