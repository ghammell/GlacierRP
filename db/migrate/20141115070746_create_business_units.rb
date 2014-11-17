class CreateBusinessUnits < ActiveRecord::Migration
  def change
    create_table :business_units do |t|
      t.string :name

      t.timestamps
      t.belongs_to :company
    end
  end
end
