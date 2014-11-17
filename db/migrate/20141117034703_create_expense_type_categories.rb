class CreateExpenseTypeCategories < ActiveRecord::Migration
  def change
    create_table :expense_type_categories do |t|
      t.belongs_to :expense_type
      t.belongs_to :expense_category

      t.timestamps
    end
  end
end
