class ExpenseCategory < ActiveRecord::Base
  has_many :expense_type_categories
  has_many :expense_types, through: :expense_type_categories
  belongs_to :company
end
