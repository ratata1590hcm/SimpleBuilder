describe("Simple Test", () => {
  it("Checks that true is true", () => {
    expect(true).to.equal(true);
  });
});

describe("My First Test", () => {
  it("Should have the correct page title", () => {
    // Visit the page
    cy.visit("https://example.com");

    // Check if the title is correct
    cy.title().should("equal", "Example Domain");
  });
});
