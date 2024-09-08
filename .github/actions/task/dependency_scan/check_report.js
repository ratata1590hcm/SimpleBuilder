const fs = require("fs");
const path = require("path");

// Get the report file path from command line arguments
const reportFilePath = process.argv[2];

// Check if the report file path is provided
if (!reportFilePath) {
  console.error("Usage: node check.js <path_to_report.json>");
  process.exit(1);
}

// Check if the provided file exists
if (!fs.existsSync(reportFilePath)) {
  console.error(`Error: File "${reportFilePath}" does not exist.`);
  process.exit(1);
}

// Function to check if the report.json contains any dependencies
function checkReport(filePath) {
  try {
    // Read the report.json file
    const reportData = fs.readFileSync(filePath, "utf-8");

    // Parse the file content as JSON
    const report = JSON.parse(reportData);

    // Check if dependencies exist and are non-empty
    if (report.dependencies && report.dependencies.length > 0) {
      // Print the content of report.json if there are dependencies
      console.log(JSON.stringify(report, null, 2));

      // Exit with code 1
      process.exit(1);
    } else {
      // Exit with code 0 (no dependencies)
      process.exit(0);
    }
  } catch (err) {
    console.error("Error reading or parsing report.json:", err);
    process.exit(1);
  }
}

// Run the check
checkReport(reportFilePath);
