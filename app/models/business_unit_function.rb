class BusinessUnitFunction < ActiveRecord::Base
  belongs_to :function
  belongs_to :business_unit
end
