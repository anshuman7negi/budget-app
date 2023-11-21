require 'rails_helper'

RSpec.feature 'Category Show Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'first user', email: 'user@gmail.com', password: 'topsecret',
                         password_confirmation: 'topsecret')
    @category = Category.create(name: 'Groceries', icon: 'stack-of-books', author: @user)
    @expense1 = Expense.create(name: 'Expense 1', amount: 10, author: @user)
    ExpenseCategory.create(expense: @expense1, category: @category)
    @expense2 = Expense.create(name: 'Expense 2', amount: 20, author: @user)
    ExpenseCategory.create(expense: @expense2, category: @category)

    visit new_user_session_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'topsecret'
    click_on 'Test Submit'
  end

  scenario 'displays category details and expenses' do
    visit category_path(@category)

    expect(page).to have_selector('.category-card', count: 3)
    expect(page).to have_content('Groceries')
    expect(page).to have_content('$30.0')
    expect(page).to have_content('Expense 1')
    expect(page).to have_content('$10.0')
    expect(page).to have_content('Expense 2')
    expect(page).to have_content('$20.0')
  end

  scenario 'redirects to new expense page when "Add new transaction" is clicked' do
    visit category_path(@category)
    click_on 'Add new transaction'
    expect(page).to have_current_path(new_category_expense_path(@category.id))
  end
end
