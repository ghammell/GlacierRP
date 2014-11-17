class Budget < ActiveRecord::Base
  has_many :headcounts
  has_many :expenses, through: :headcounts
  has_many :cost_centers, through: :headcounts
  belongs_to :user
end
