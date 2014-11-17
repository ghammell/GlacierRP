class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name

      t.timestamps
      t.belongs_to :business_unit
    end
  end
end
