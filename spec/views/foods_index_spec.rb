require 'rails_helper'
RSpec.feature 'Foods index', type: :feature do
  let!(:user) do
    User.create(name: 'lengushuru', email: 'example@example.com', password: 'password', confirmed_at: Time.current)
  end
  before do
    ActionMailer::Base.deliveries.clear
    sign_in user
    3.times { Food.create!(name: 'Test Food', measurement: 'Pound', price: 10.00, quantity: 10, user:) }
    visit foods_path
  end
  scenario 'user can add a new food' do
    click_on 'Add Food'
    expect(page).to have_current_path(new_food_path)
  end
  scenario 'allows user to add a food' do
    click_on 'Add Food'
    fill_in 'Name', with: 'lengushuru'
    fill_in 'Measurement', with: 'Pound'
    fill_in 'Price', with: 10.00
    fill_in 'Quantity', with: 10
    click_on 'Create Food'
    expect(page).to have_content 'lengushuru'
  end

  it 'should have all food details' do
    expect(page).to have_content('Food')
    expect(page).to have_content('Measurement Unit')
    expect(page).to have_content('Price')
    expect(page).to have_content('Actions')
  end
end
