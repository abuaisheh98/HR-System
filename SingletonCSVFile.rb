require 'csv'
require 'singleton'
require_relative 'Manager'
require_relative 'Lead'
require_relative 'Junior'

class SingletonCSVFile
  include Singleton

  def header
    CSV.open('Employee_Information.csv', 'wb') do |csv|
      csv << ['type', 'id', 'First Name', 'Last Name', 'Age', 'Address', 'Salary']
    end
  end

  def save(objects)
    count = 0
    CSV.open('Employee_Information.csv', 'ab') do |csv|
      while count < objects.length
        csv << getData(objects[count])
        count += 1
      end
    end
  end

  def read
    instances = []
    counter = 0
    CSV.foreach('Employee_Information.csv') do |row|
      unless (counter == 0)
        case row[0]
        when 'Manager'
          instance = Manager.new(row[1], row[2], row[3], row[4], row[5], row[6])
        when 'Lead'
          instance = Lead.new(row[1], row[2], row[3], row[4], row[5], row[6])
        when 'Junior'
          instance = Junior.new(row[1], row[2], row[3], row[4], row[5], row[6])
        end
        instances.push(instance)
      end
      counter += 1
    end
    instances
  end

  def getData(object)
    data = [object.class]
    object.instance_variables.each do |v|
      data.push(object.instance_variable_get(v))
    end
    data
  end
end
