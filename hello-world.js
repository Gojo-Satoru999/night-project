// Task 1: hello-world.js
console.log("HELLO WORLD");

// Task 2: server.js
const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });
  res.end("<h1>Hello Node!!!!</h1>\n");
});

server.listen(3000, () => {
  console.log("Server is running on http://localhost:3000");
});

// Task 3: file-io.js
const fs = require("fs");

// Write to welcome.txt
fs.writeFile("welcome.txt", "Hello Node", (err) => {
  if (err) throw err;
  console.log("File 'welcome.txt' has been created!");
});

// Read hello.txt
fs.readFile("hello.txt", "utf8", (err, data) => {
  if (err) throw err;
  console.log(data);
});

// Task 4: password-generator.js
const generatePassword = require("generate-password");

function generateRandomPassword() {
  const password = generatePassword.generate({
    length: 10,
    numbers: true,
    symbols: true,
  });
  console.log("Generated Password:", password);
}

generateRandomPassword();

// Task 5: email-sender.js
const nodemailer = require("nodemailer");

// Create a transporter
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "casoeries@gmail.com",
    pass: "Samuel24/7",
  },
});

// Define email options
const mailOptions = {
  from: "casoeries@gmail.com",
  to: "casoeries@outlook.com",
  subject: "Test Email",
  text: "This is a test email sent from Node.js",
};

// Send email
transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    console.log("Email could not be sent:", error);
  } else {
    console.log("Email sent:", info.response);
  }
});
