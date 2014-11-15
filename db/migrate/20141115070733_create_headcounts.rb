class CreateHeadcounts < ActiveRecord::Migration
  def change
    create_table :headcounts do |t|
      t.references :manager

      t.timestamps
    end
  end
end
