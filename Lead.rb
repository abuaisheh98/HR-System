require_relative 'Employee'

class Lead < Employee
  def benefit
    puts "Competitive Salary\nYearly Bounce\nFamily M.I"
  end

  def description
    puts "Handle Team\nTeam Meeting\nUpdate Manager"
  end
end