require_relative 'Employee'

class Manager < Employee
  def benefit
    puts "High Salary\nHigh Raise\nPremium M.I"
  end

  def description
    puts "Mange Task\nBoard Meeting\nUpdate Owner"
  end
end