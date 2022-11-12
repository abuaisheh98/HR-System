require_relative 'Manager'
require_relative 'Lead'
require_relative 'Junior'
require 'securerandom'

class EmployeeFactory
  def create_manager(first_name, last_name, age, address, salary)
    Manager.new(SecureRandom.uuid, first_name, last_name, age, address, salary)
  end

  def create_lead(first_name, last_name, age, address, salary)
    Lead.new(SecureRandom.uuid, first_name, last_name, age, address, salary)
  end

  def create_junior(first_name, last_name, age, address, salary)
    Junior.new(SecureRandom.uuid, first_name, last_name, age, address, salary)
  end
end
