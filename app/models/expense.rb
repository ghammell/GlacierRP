class Expense < ActiveRecord::Base
  belongs_to :budget
  belongs_to :cost_center
end
