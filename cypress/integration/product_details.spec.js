describe('Visiting the home page', () => {

  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Change to the product detail page when you click on a product", () => {
    cy.get('[alt="Scented Blade"]').click();
    cy.get(".product-detail").should("exist");

  });


})