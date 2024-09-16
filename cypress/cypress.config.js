const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: "https://www.cypress.io",
    viewportWidth: 1280,
    viewportHeight: 720,
    screenshotsFolder: "/workspace/cypress/output/screenshots",
    videosFolder: "/workspace/cypress/output/videos",
    supportFile: false,
    specPattern:
      "/workspace/cypress/output/integration/**/*.cy.{js,jsx,ts,tsx}", // Adjust based on your test file extensions
    defaultCommandTimeout: 10000,
    pageLoadTimeout: 60000,
    env: {
      apiUrl: "http://localhost:3000/api",
    },
    setupNodeEvents(on, config) {
      // Implement Node event listeners if needed
    },
  },
  reporter: "mochawesome",
  reporterOptions: {
    reportDir: "/workspace/cypress/output/reports",
    overwrite: false,
    html: true,
    json: true,
  },
});
