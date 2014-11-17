class ExpenseType < ActiveRecord::Base
  has_many :expense_type_categories
  has_many :expense_categories, through: :expense_type_categories
end
