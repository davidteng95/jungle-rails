describe('Jungle App - Product Details Page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('should see the product details page when a product is clicked', () => {
    cy.contains('.products article', 'Scented Blade').click();
    cy.get('.products-show').should('be.visible');
  });
});