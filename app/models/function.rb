class Function < ActiveRecord::Base
  has_many :cost_centers
  belongs_to :business_unit
end
