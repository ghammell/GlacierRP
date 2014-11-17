  class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.float :tax_rate
      t.string :name

      t.timestamps
      t.belongs_to :user
    end
  end
end
