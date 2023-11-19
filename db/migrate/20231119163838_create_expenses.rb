class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :amount
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users, to_delete: :cascade }
      t.timestamps
    end
  end
end
