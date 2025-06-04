let express = require("express");
let app = express();
let path = require("path");
require("dotenv").config({ path: "./.env" });

// Import database connection
const connection = require("./src/config/database");

// Import routes
const routes = require("./src/config/routes");

app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");

// Use routes
app.use("/", routes);

app.listen(process.env.PORT);
console.log("Server listening on port " + process.env.PORT);

// Close connection when app terminates
process.on('SIGINT', () => {
  connection.end();
  process.exit();
});