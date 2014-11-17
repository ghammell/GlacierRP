class BusinessUnit < ActiveRecord::Base
  has_many :functions
  has_many :cost_centers, through: :functions
end
