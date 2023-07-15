require 'rails_helper'

RSpec.describe 'Public Recipes Index Page', type: :feature do
  let!(:user) do
    User.create(name: 'charles', email: 'charles@example.com', password: 'password', confirmed_at: Time.current)
  end
  let!(:recipes) do
    [
      Recipe.create(name: 'choma', description: 'This is recipe 1', user:, public: true),
      Recipe.create(name: 'waruu', description: 'This is waruu', user:, public: true),
      Recipe.create(name: 'samosa', description: 'This is samosa', user:, public: true)
    ]
  end

  before do
    ActionMailer::Base.deliveries.clear
    user.confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
    user.confirmed_at = Time.current
    user.save
    sign_in user
    visit public_recipes_index_path
  end

  it 'displays a list of public recipes' do
    expect(recipes.first.name).to have_content('choma')
    expect(recipes.first.description).to have_content('This is recipe 1')
    expect(recipes.second.name).to have_content('waruu')
    expect(recipes.second.description).to have_content('This is waruu')
  end
end
