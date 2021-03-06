class CreateHeadcounts < ActiveRecord::Migration
  def change
    create_table :headcounts do |t|
      t.references :manager
      t.date :start_date
      t.date :end_date
      t.string :headcount_type
      t.integer :salary
      t.float :bonus
      t.integer :count

      t.timestamps
      t.belongs_to :cost_center
      t.belongs_to :budget
    end
  end
end
