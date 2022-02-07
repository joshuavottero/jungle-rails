require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "a product with all fields given" do
      it "will save" do
        @category = Category.new(name: "test")
        @category.save
        @product = Product.new(name: "test_product", description: "this is a test", category_id: @category.id, quantity: 3, image: "image_url", price: 30)
        @product.save

        expect(@product.id).to be_present
      end
    end

    context "the name field is missing" do
      it "will have a error massage: Name can't be blank" do
        @category = Category.new(name: "test")
        @category.save
        @product = Product.new(description: "this is a test", category_id: @category.id, quantity: 3, image: "image_url", price: 30)
        @product.save

        expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
      end
    end

    context "the price field is missing" do
      it "will have a error massage: Price cents is not a number" do
        @category = Category.new(name: "test")
        @category.save
        @product = Product.new(name: "test_product", description: "this is a test", category_id: @category.id, quantity: 3, image: "image_url")
        @product.save

        expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      end
    end

    context "the quantity field is missing" do
      it "will have a error massage: Quantity can't be blank" do
        @category = Category.new(name: "test")
        @category.save
        @product = Product.new(name: "test_product", description: "this is a test", category_id: @category.id, image: "image_url", price: 30)
        @product.save

        expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
      end
    end

    context "the category field is missing" do
      it "will have a error massage: Category can't be blank" do
        @category = Category.new(name: "test")
        @category.save
        @product = Product.new(name: "test_product", description: "this is a test", quantity: 3, image: "image_url", price: 30)
        @product.save

        expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
      end
    end
  end
end
