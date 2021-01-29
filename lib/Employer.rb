class Employer < ActiveRecord::Base

    has_many :employees

    def self.list
        self.all.index_by(&:name)
    end



    def hire_employee(name)
        if Employee.all.map { |employee| employee.name }.include?(name)
        puts "Employee with this name already exists. Try adding middle inital."
        else
            Employee.create(name: name, employer_id: self.id)
            puts "Welcome #{name}"
        end
    end

    def fire_employee(employee_object)
        #remove from employeeprojects
        employee_object.employeeprojects.destroy_all
        #remove from employeeskills
        employee_object.employeeskills.destroy_all
        #remove from employees
        employee_object.destroy
    end



    def my_reports
        self.employees.each {|employee| puts "#{employee.name}\n"}
        "have a nice day"
    end

end

