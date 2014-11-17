class Budget < ActiveRecord::Base
  has_many :expenses
  has_many :cost_centers, through: :expenses
  belongs_to :user
end
