class Company < ActiveRecord::Base
  has_many :users
  has_many :expense_categories
end
