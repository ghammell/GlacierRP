class CostCenter < ActiveRecord::Base
  has_many :headcounts
  has_many :expenses, through: :headcounts
  has_many :function_cost_centers
  has_many :functions, through: :function_cost_centers
end
