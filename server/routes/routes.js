const express = require("express");
const userController = require("../controllers/userController");
const authController = require("./../controllers/auth"); // Assuming you have an authController for handling authentication
const router = express.Router();

// Protect all routes after this middleware
router.use(authController.protect);

router
  .route("/")
  .get(userController.getAllUsers)
  .post(userController.createUser);

router.route("/:idOrName").get(userController.getUser);

router
  .route("/:id")
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

router.post("/login", userController.login);

router.post("/createUser", userController.uploadPhoto, userController.createUser);
router.post("/recognizeFace", userController.uploadPhoto, userController.recognizeFace);
module.exports = router;
