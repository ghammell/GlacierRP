class ExpenseCategory < ActiveRecord::Base
  has_many :expense_types
end
