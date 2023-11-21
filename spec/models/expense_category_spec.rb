require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  before :each do
    @user = User.new(name: 'first user')
    @category = Category.new(name: 'category', icon: 'category.png', author: @user)
    @expense = Expense.new(name: 'expense', amount: 80, author: @user)
    @expense_category = ExpenseCategory.new(expense: @expense, category: @category)
  end

  it 'is not valid without an expense' do
    @expense_category.expense = nil
    expect(@expense_category).to_not be_valid
  end

  it 'is not valid without a category' do
    @expense_category.category = nil
    expect(@expense_category).to_not be_valid
  end

  it 'has a valid expense_id matching expense' do
    expect(@expense_category.expense_id).to eql(@expense.id)
  end

  it 'has a valid category_id matching category' do
    expect(@expense_category.category_id).to eql(@category.id)
  end
end
