require 'rails_helper'

RSpec.feature 'Categories Index Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'first user', email: 'user@gmail.com', password: 'topsecret',
                         password_confirmation: 'topsecret')
    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_on 'Test Submit'
  end

  scenario 'displays a message when no categories are found' do
    visit categories_path
    expect(page).to have_content('No Category Found')
    expect(page).to have_content('Add category')
  end

  scenario 'displays categories with details when they exist' do
    category = Category.create(name: 'Groceries', icon: 'stack-of-books.png', author: @user)
    visit categories_path
    expect(page).to have_selector('.category-card', text: category.name.capitalize)
    expect(page).to have_link(category.name.capitalize, href: category_path(category))
  end

  scenario 'clicking on "Add category" link in the footer' do
    visit categories_path
    click_on 'Add category'
    expect(page).to have_current_path(new_category_path)
  end
end
