class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :tax_rate

      t.timestamps
      t.belongs_to :user
    end
  end
end
