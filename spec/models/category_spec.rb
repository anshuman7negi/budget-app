require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'first user')
    @category = Category.new(name: 'Repair', icon: 'img.png', author: @user)
  end

  it ' name data is not valid' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'icon data is not valid' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'should check icon is valid' do
    expect(@category).to be_valid
  end

  it 'should check name is valid' do
    expect(@category).to be_valid
  end
end
