describe('Jungle App - Add to Cart', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('should see the number of items in cart add by one if a product is added', () => {
    cy.get('.btn').contains('Add').click({ force: true });
    cy.get('.nav-link').should('contain.text', '1');
  });
});