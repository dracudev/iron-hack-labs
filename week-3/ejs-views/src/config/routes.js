const express = require("express");
const path = require("path");
const router = express.Router();
const connection = require("./database");

router.get("/", function (req, res) {
  res.render("index", {
    title: "Home page",
    message: "Welcome to the home page",
  });
});

router.get("/contact", function (req, res) {
  res.render("contact", {
    title: "Contact page",
    message: "Get in touch with us",
  });
});

router.post("/contact", function (req, res) {
  const { name, email, message } = req.body;
  
  connection.query(
    "INSERT INTO contacts (name, email, message) VALUES (?, ?, ?)",
    [name, email, message],
    function (error, results) {
      if (error) {
        console.log(error);
        res.render("contact", {
          title: "Contact page",
          message: "Error sending message. Please try again.",
        });
      } else {
        res.render("contact", {
          title: "Contact page",
          message: "Thank you! Your message has been sent.",
        });
      }
    }
  );
});

router.get("/administration", function (req, res) {
  res.render("administration", {
    title: "Administration page",
    message: "Welcome to the administration page",
  });
});

router.get("/static", function (req, res) {
  res.sendFile(path.join(__dirname, "../../public", "pages/static.html"));
});

module.exports = router;