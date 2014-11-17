class CostCenter < ActiveRecord::Base
  has_many :headcounts
  has_many :expenses, through: :headcounts
  belongs_to :function
end
