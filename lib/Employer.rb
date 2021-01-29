class Employer < ActiveRecord::Base

    has_many :employees

    def self.list
        self.all.index_by(&:name)
    end

    def employee_active_project(name)
        if Employeeproject.all.select {|project| project.status == "Active"}.map {|project| project.employee_id}.include?(Employee.all.find_by(name: name).id)
        puts "Employee is busy."
        end
    end

    def hire_employee(name)
        if Employee.all.map { |employee| employee.name }.include?(name)
        puts "Employee with this name already exists. Try adding middle inital."
        else
            Employee.create(name: name, employer_id: self.id)
            puts "Welcome #{name}"
        end
    end

    def my_reports
        self.employees.each {|employee| puts "#{employee.name}\n"}
        "have a nice day"
    end

end

