require_relative 'EmployeeFactory'
require_relative 'SingletonCSVFile'

puts "Do you want to\n1-Load existing file\n2-Write file"
action = gets.chomp.to_i
if action == 1
  puts SingletonCSVFile.instance.read
else
  factory = EmployeeFactory.new
  SingletonCSVFile.instance.header
  instances=[]
  begin
    puts "Welcome To HR System\nPlease enter employee type\n1-Manager\n2-Lead\n3-Junior"
    response = gets.chomp.to_i
    raise 'Please Enter a valid value ...' if (response < 1) || (response > 3)

    puts 'First Name :'
    first_name = gets.chomp
    puts 'Last Name :'
    last_name = gets.chomp
    puts 'Age :'
    age = gets.chomp
    puts 'Address :'
    address = gets.chomp
    puts 'Salary :'
    salary = gets.chomp

    case response
    when 1
      employee = factory.create_manager(first_name, last_name, age, address, salary)
      instances.push(employee)
    when 2
      employee = factory.create_lead(first_name, last_name, age, address, salary)
      instances.push(employee)
    when 3
      employee = factory.create_junior(first_name, last_name, age, address, salary)
      instances.push(employee)
    end
    puts 'Do you want to add more employee? y/n'
    acceptance = gets.chomp
    raise 'Ok you can add an employee now ...' if acceptance == 'y'

    puts 'Do you want save employees in Employee_Information file ? y/n'
    user_response = gets.chomp
    SingletonCSVFile.instance.save(instances) if user_response == 'y'
  rescue StandardError => e
    puts e.message
    retry
  end
end


