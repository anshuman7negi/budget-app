class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories, dependent: :destroy

  validates :name, presence: true, length: { in: 5..15 }, uniqueness: true
  validates :icon, presence: true
end
