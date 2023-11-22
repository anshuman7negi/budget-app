require 'rails_helper'

RSpec.feature 'Add New Category Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'first user', email: 'user@gmail.com', password: 'topsecret',
                         password_confirmation: 'topsecret')
    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_on 'Test Submit'
  end

  scenario 'displays the form for adding a new category' do
    visit new_category_path
    expect(page).to have_content('Add New Category')
    expect(page).to have_selector('form[action="/categories"][method="post"]')

    expect(page).to have_field('category_name')
    expect(page).to have_selector('ul.list-unstyled')
    expect(page).to have_button('Add Category')
  end

  scenario 'successfully adds a new category' do
    visit new_category_path
    fill_in 'category[name]', with: 'Groceries'
    find('input[value="icon/stack-of-books.png"]').click
    click_on 'Add Category'
    expect(page).to have_current_path(categories_path)
  end
end
