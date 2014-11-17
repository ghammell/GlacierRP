class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.string :account_id

      t.timestamps
      t.belongs_to :expense_category
    end
  end
end
