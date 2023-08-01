require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it "should save when all fields are filled" do
      product = Product.new(
        name: 'Example 123',
        price: 111,
        quantity: 222,
        category: Category.new(name: 'Category 123')
      )
    expect(product.save).to be true
    end

    it "should not save when name is nil" do
      product = Product.new(
        price: 111,
        quantity: 222,
        category: Category.new(name: 'Category 123')
      )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not save when price is nil" do
      product = Product.new(
        name: 'Example 123',
        quantity: 222,
        category: Category.new(name: 'Category 123')
      )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Price is not a number")
    end

    it "should not save when quantity is nil" do
      product = Product.new(
        name: 'Example 123',
        price: 111,
        category: Category.new(name: 'Category 123')
      )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should not save when quantity is nil" do
      product = Product.new(
        name: 'Example 123',
        price: 111,
        quantity: 222
      )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
