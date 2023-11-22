# spec/features/expenses/new_spec.rb
require 'rails_helper'

RSpec.feature 'Expense Form', type: :feature do
  before(:each) do
    @user = User.create!(name: 'first user', email: 'user@gmail.com', password: 'topsecret',
                         password_confirmation: 'topsecret')
    @category = Category.create!(name: 'Groceries', icon: 'stack-of-books.png', author: @user)
    @categories = [@category]
    @expense = Expense.new(name: 'Test Expense', amount: 50.0, author: @user)

    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_on 'Test Submit'
  end

  scenario 'can see the form label : NAME' do
    visit new_category_expense_path(@category)
    expect(page).to have_content('Name')
  end

  scenario 'can see the form label: AMOUNT' do
    visit new_category_expense_path(@category)
    expect(page).to have_content('Add New Expense')
  end

  scenario 'can see the form label: Category' do
    visit new_category_expense_path(@category)
    expect(page).to have_content('Category')
  end
end
