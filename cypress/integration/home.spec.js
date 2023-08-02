describe('Jungle App - Home Page', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  // can be removed since it is redundant, it is already checked in the beforeEach
  it('should visit the home page', () => {
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get('.products article').should('be.visible');
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});