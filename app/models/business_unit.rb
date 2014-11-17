class BusinessUnit < ActiveRecord::Base
  has_many :business_unit_functions
  has_many :functions, through: :business_unit_functions
  has_many :cost_centers, through: :functions
end
