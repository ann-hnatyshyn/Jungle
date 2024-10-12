describe('Add to Cart', () => {
  beforeEach(() => {
    
    cy.visit('/');
  });

  it('should increase the cart count when "Add to Cart" is clicked', () => {

    cy.get('nav .cart-count').should('contain', '0'); 


    cy.get('.products article').first().find('button').contains('Add').click();


    cy.get('nav .cart-count').should('contain', '1');
  });
});