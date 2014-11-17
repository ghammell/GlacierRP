class CreateExpenseCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories do |t|
      t.string :name

      t.timestamps
      t.belongs_to :company
    end
  end
end
