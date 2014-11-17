class CreateBusinessUnitFunctions < ActiveRecord::Migration
  def change
    create_table :business_unit_functions do |t|

      t.timestamps
      t.belongs_to :function
      t.belongs_to :business_unit
    end
  end
end
