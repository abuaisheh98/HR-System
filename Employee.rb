class Employee
  attr_accessor :id, :first_name, :last_name, :age, :address, :salary

  def initialize(id, first_name, last_name, age, address, salary)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @age = age
    @address = address
    @salary = salary
  end

  def benefit
    raise 'Description method is not available ... !'
  end

  def description
    raise 'Description method is not available ... !'
  end

  def employee_info
    [id, first_name, last_name, age, address, salary]
  end
end