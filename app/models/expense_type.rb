class ExpenseType < ActiveRecord::Base
  belongs_to :expense_categories
end
