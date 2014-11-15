class CreateCostCenters < ActiveRecord::Migration
  def change
    create_table :cost_centers do |t|

      t.timestamps
    end
  end
end
