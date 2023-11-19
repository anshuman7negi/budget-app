class CreateExpenseCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :expense_categories do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :expense, null: false, foreign_key: { to_table: :expenses }
      t.timestamps
    end
  end
end
