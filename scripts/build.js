const fs = require("fs");
const path = require("path");

require("dotenv").config();

const paths = {
  input: path.resolve(__dirname, "../index.html"),
  output: path.resolve(__dirname, "../build/index.html"),
};

fs.mkdirSync(path.dirname(paths.output), { recursive: true });

let html = fs.readFileSync(paths.input, "utf-8");

for (const env in process.env) {
  html = html.replace(
    new RegExp(`\\{\\{ ${env} \\}\\}`, "ug"),
    process.env[env]
  );
}

fs.writeFileSync(paths.output, html, "utf-8");
