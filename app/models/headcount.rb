class Headcount < ActiveRecord::Base
  has_many :subordinates, class_name: 'Headcount', foreign_key: 'manager_id'
  belongs_to :manager, class_name: 'Headcount'
  has_many :expenses
  belongs_to :cost_center
  belongs_to :budget

  after_create :calculate_monthly_expenses

  def calculate_monthly_expenses
    daily_cost = get_daily_cost(self)
    month_days = get_month_days(self.start_date, self.end_date)
    p month_days
    month_days.each do |month, days|
      amount = days * daily_cost
      expense = Expense.create(month: month, year: start_date.year, amount: amount)
      self.expenses << expense
      self.budget.expenses << expense
    end
  end

  def get_daily_cost(headcount)
    annual_cost = headcount.salary * (1 + headcount.bonus) * (1 + headcount.budget.tax_rate)
    remaining_days = (headcount.end_date - headcount.start_date).to_int
    annual_cost / 365
  end

  def get_month_days(start_date, end_date)
    month_days = {}
    months = (start_date.month..end_date.month).to_a
    start_month_days = Time.days_in_month(start_date.month, start_date.year) - start_date.day + 1
    month_days[start_date.month] = start_month_days
    months[1..-2].each {|month| month_days[month] = Time.days_in_month(month, start_date.year)}
    month_days[end_date.month] = end_date.day
    month_days
  end
end
