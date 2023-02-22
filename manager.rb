
require "byebug"
require_relative "employee.rb"

class Manager < Employee
    attr_reader :employees, :salary

    def initialize(name, title, salary, boss)
        super
        @employees = []
        @salary = salary
    end

    def hire(candidate)
        @employees << candidate
        # p @employees
    end


    def total_sub_salary
        total = 0

        @employees.each do | employee |
            if employee.is_a?(Manager)
                total += employee.total_sub_salary
                total += employee.salary
            else
                total += employee.salary
            end
        end
        total
    end


    def bonus(multiplier)

       total_sub_salary * multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shanna = Employee.new("Shanna", "TA", 12000, "Darren")
david = Employee.new("David", "TA" ,10000, "Darren")

ned.hire(darren)
darren.hire(shanna)
darren.hire(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
