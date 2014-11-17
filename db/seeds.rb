class CreateUsers
  def self.create_manager
    User.create(first_name: 'Craig', last_name: 'Hammell', email: 'cilphex@gmail.com', password: 'abcdefgh')
  end

  def self.create_user
    User.first.subordinates.create(first_name: 'Gary', last_name: 'Hammell', email: 'ghammell1@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Bob', last_name: 'Hammell', email: 'bob@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Jack', last_name: 'Hammell', email: 'jack@gmail.com', password: 'abcdefgh')
    User.first.subordinates.create(first_name: 'Angela', last_name: 'Hammell', email: 'angela@gmail.com', password: 'abcdefgh')
  end
end

class CreateBudgets
  def self.create
    User.last.budgets.create(name: '2014 Plan', tax_rate: 0.15)
    User.last.budgets.create(name: '2014 Q1 Update', tax_rate: 0.15)
    User.last.budgets.create(name: '2014 Q2 Update', tax_rate: 0.15)
  end
end

class CreateCompanies
  def self.create
    Company.create(name: 'Test Company')
    @company = Company.create(name: 'HelloMellon, Inc')
  end

  def self.add_to_users
    User.all.each {|user| @company.users << user}
  end
end

class CreateBusinessUnits
  def self.create
    BusinessUnit.create(name: 'Marketing Cloud')
    BusinessUnit.create(name: 'Service Cloud')
    BusinessUnit.create(name: 'Sales Cloud')
  end

  def self.add_to_companies
    BusinessUnit.all.each {|business_unit| Company.last.business_units << business_unit}
  end
end

class CreateFunctions
  def self.create
    Function.create(name: 'R&D')
    Function.create(name: 'Sales')
    Function.create(name: 'Marketing')
    Function.create(name: 'Operations')
  end

  def self.add_to_business_units
    BusinessUnit.all.each do |business_unit|
      Function.all.each {|function| business_unit.functions << function}
    end
  end
end

class CreateCostCenters
  def self.create
    CostCenter.create(name: 'Dev')
    CostCenter.create(name: 'QA')
    CostCenter.create(name: 'UX')
    CostCenter.create(name: 'AE')
    CostCenter.create(name: 'Sales Manager')
    CostCenter.create(name: 'Sales Engineer')
  end

  def self.add_to_functions
    Function.all.each do |function|
      CostCenter.all.each {|cost_center| function.cost_centers << cost_center}
    end
  end
end

class CreateHeadcount
  def self.new
    month = (rand(12) + 1)
    month_days = Time.days_in_month(month, 2014)
    day = (rand(month_days) + 1)
    Headcount.new(start_date: '2014-' + month.to_s + '-' + day.to_s, end_date: '2014-12-31', headcount_type: 'regular', salary: rand(200000)+100000, bonus: rand(), count: rand(3) + 1)
  end

  def self.add_to_cost_centers(head)
    CostCenter.find(rand(6) + 1).headcounts << head
  end

  def self.add_to_budgets
    Budget.all.each do |budget|
      10.times do
        head = budget.headcounts << new
        add_to_cost_centers(head)
      end
    end
  end
end

class CreateExpenses
  def self.create_categories
    @workforce = ExpenseCategory.create(name: 'Workforce Costs')
    @travel = ExpenseCategory.create(name: 'T&E')
    @supplies = ExpenseCategory.create(name: 'Supplies')
  end

  def self.add_categories_to_companies
    ExpenseCategory.all.each {|category| Company.last.expense_categories << category}
  end

  def self.create_types
    @workforce.expense_types << ExpenseType.create(name: 'Base Salary')
    @workforce.expense_types << ExpenseType.create(name: 'Bonus')
    @workforce.expense_types << ExpenseType.create(name: 'Benefits and Taxes')
    @travel.expense_types << ExpenseType.create(name: 'Air Travel')
    @travel.expense_types << ExpenseType.create(name: 'Taxi')
    @travel.expense_types << ExpenseType.create(name: 'Meals')
    @supplies.expense_types << ExpenseType.create(name: 'Supplies')
  end

  def self.create_expenses
  end
end

CreateUsers.create_manager
CreateUsers.create_user
CreateBudgets.create
CreateCompanies.create
CreateCompanies.add_to_users
CreateBusinessUnits.create
CreateBusinessUnits.add_to_companies
CreateFunctions.create
CreateFunctions.add_to_business_units
CreateCostCenters.create
CreateCostCenters.add_to_functions
CreateExpenses.create_categories
CreateExpenses.add_categories_to_companies
CreateExpenses.create_types
CreateHeadcount.add_to_budgets
