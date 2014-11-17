class Company < ActiveRecord::Base
  has_many :users
  has_many :expense_categories
  has_many :business_units
end
