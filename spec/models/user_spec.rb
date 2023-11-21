require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = User.new(name: 'John Doe', email: 'johsn@example.com', password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
