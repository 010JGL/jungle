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

  it("The cart is incrementing when we add an item", () => {

    cy.get(".button_to add_item_cart_path").click({force: true});
    cy.get(".add-cart-link").contains("1");
    
  });

})