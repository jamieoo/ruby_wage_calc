#A super class for Salary_pay & Hourly_pay to inherit from called 'Employee'

class Employee

  attr_reader :name
  def name=name
    if name == ""
      raise "Invalid name entry"
    end
    @name = name
  end

  def print_name
    puts "Name: #{name}" #this is the same as a call to self.name
  end
end


#Salaried employees calculator


class Salary_pay < Employee
  def initialize(name="anon", salary=0)
    self.name = name
    self.salary = salary
  end

  def self.security(name)
    Salary_pay.new(name, 50000.00)
  end

  attr_reader :salary
  def salary=(salary)
    if salary < 0
      raise "Invalid salary"
    end
    @salary = salary
  end

  def paystub
    bi_weekly_pay = (self.salary / 365.0) * 14
    formatted_pay = format("$%.2f", bi_weekly_pay)
    puts "#{print_name}"
    puts "Your pay this week is: #{formatted_pay}"
  end
end

#Hourly employees calculator

class Hourly_pay < Employee
  def initialize(name="anon", hourly_pay=0, hours_worked=0)
    self.name = name
    self.hourly_pay = hourly_pay
    self.hours_worked = hours_worked
  end

  def self.cashier(name)
    Hourly_pay.new(name, 12.50, 40)
  end

  attr_reader :hourly_pay
  def hourly_pay=(hourly_pay)
    if hourly_pay < 0
      raise "Invalid pay"
    end
    @hourly_pay = hourly_pay
  end

  attr_reader :hours_worked
  def hours_worked=(hours_worked)
    if hours_worked < 0
      raise "Invalid hours worked"
    end
    @hours_worked = hours_worked
  end

  def paystub
    bi_weekly_pay = hourly_pay * hours_worked
    formatted_pay = format("$%.2f", bi_weekly_pay)
    puts "#{print_name}"
    puts "Your pay this week is: #{formatted_pay}"
  end
end
