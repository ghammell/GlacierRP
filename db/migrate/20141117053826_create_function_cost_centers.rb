class CreateFunctionCostCenters < ActiveRecord::Migration
  def change
    create_table :function_cost_centers do |t|

      t.timestamps
      t.belongs_to :function
      t.belongs_to :cost_center
    end
  end
end
