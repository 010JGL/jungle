require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
      it 'is valid with all the right values' do
        @category = Category.new
        params = { name: 'Bird Paradise', description: 'Tropical plant', quantity: 20, category: @category, price_cents: 6000 }
        expect(Product.new(params)).to be_valid
      end

      it 'is invalid with the name missing' do
        @category = Category.new
        params = { description: 'Tropical plant', quantity: 20, category: @category, price_cents: 6000 }
        expect(Product.new(params)).to_not be_valid
      end

      it 'is invalid with the quantity missing' do
        @category = Category.new
        params = { name: 'Bird Paradise', description: 'Tropical plant', category: @category, price_cents: 6000 }
        expect(Product.new(params)).to_not be_valid
      end

      it 'is invalid with the category missing' do
        @category = Category.new
        params = { name: 'Bird Paradise', description: 'Tropical plant', quantity: 20, price_cents: 6000 }
        expect(Product.new(params)).to_not be_valid
      end

      it 'is invalid with the price missing' do
        @category = Category.new
        params = { name: 'Bird Paradise', description: 'Tropical plant', quantity: 20, category: @category }
        expect(Product.new(params)).to_not be_valid
      end

  end
  
end
