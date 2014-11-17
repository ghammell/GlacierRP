class Headcount < ActiveRecord::Base
  has_many :subordinates, class_name: 'Headcount', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Headcount'
  has_many :expenses
  belongs_to :cost_center
  belongs_to :budget

  after_save :calculate_expenses

  def calculate_expenses
    annual_cost = self.salary * (1 + self.bonus) * (1 + self.budget.tax_rate)
    remaining_days = (self.end_date - self.start_date).to_int
    p self.start_date.day
  end
end
