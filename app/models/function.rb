class Function < ActiveRecord::Base
  has_many :business_unit_functions
  has_many :business_units, through: :business_unit_functions
  has_many :function_cost_centers
  has_many :cost_centers, through: :function_cost_centers
end
