class FunctionCostCenter < ActiveRecord::Base
  belongs_to :function
  belongs_to :cost_center
end
