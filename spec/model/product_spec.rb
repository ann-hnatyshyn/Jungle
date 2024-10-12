require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'Electronics')
    end

    it 'saves successfully when all fields are set' do
      @product = Product.new(
        name: 'Venus Fly Trap',
        price: 999.99,
        quantity: 8,
        category: @category
      )

      it("There is products on the page", () => {
        cy.visit("/");
        cy.get(".products article").should("be.visible");
      });

      it("There is 2 products on the page", () => {
       cy.visit("/");
       cy.get(".products article").should("have.length", 2);
      });

      expect(@product).to be_valid
    end
  end
end