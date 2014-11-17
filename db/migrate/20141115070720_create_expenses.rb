class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :month
      t.string :year
      t.float :amount

      t.timestamps
      t.belongs_to :headcount
      t.belongs_to :expense_type
      t.belongs_to :budget
    end
  end
end
