class Budget < ActiveRecord::Base
  has_many :expenses
  has_many :cost_centers, through: :expenses
  has_many :headcounts
  belongs_to :user
end
