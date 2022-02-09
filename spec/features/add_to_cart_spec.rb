require 'rails_helper'

RSpec.feature "Visitor can add a item to cart", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the number of items in the cart change" do
    # ACT
    visit root_path
    
    click_button("Add", match: :first)
    
    cart = find_by_id("my-cart")
    # DEBUG / VERIFY
    save_screenshot

    expect(cart).to have_text 'My Cart (1)'
  end

end
