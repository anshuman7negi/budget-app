require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'first user')
    @expense = Expense.new(name: 'Groceries', amount: 50.0, author: @user)
  end

  it 'is valid with valid attributes' do
    expect(@expense).to be_valid
  end

  it 'is not valid without a name' do
    @expense.name = nil
    expect(@expense).not_to be_valid
  end

  it 'is not valid without an amount' do
    @expense.amount = nil
    expect(@expense).not_to be_valid
  end

  it 'is not valid with a non-numeric amount' do
    @expense.amount = 'abc'
    expect(@expense).not_to be_valid
  end

  it 'belongs to an author (user)' do
    expect(@expense.author).to eq(@user)
  end
end
