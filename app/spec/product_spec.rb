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
      expect(@product).to be_valid
    end
  end
end