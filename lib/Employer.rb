class Employer < ActiveRecord::Base

    has_many :employees


    def create_project(title)
        Project.create(name: title)
    end

    def employee_active_project(name)
        if Employeeproject.all.select {|project| project.status == "Active"}.map {|project| project.employee_id}.include?(Employee.all.find_by(name: name).id)
        "Employee is busy."
        end

    end
    
    def add_to_project(name, project)
        if Employeeproject.all.select {|project| project.status == "Active"}.map {|project| project.employee_id}.include?(Employee.all.find_by(name: name).id)
        "Employee is busy."
        else
            Employeeproject.create(employee_id: Employee.all.find_by(name: name).id, project_id: Project.all.find_by(name: project).id, status: "Active")
        end
    end

    def hire_employee(name, manager)
        if Employee.all.map { |employee| employee.name }.include?(name)
        "Employee with this name already exists. Try adding middle inital."
        else
            Employee.create(name: name, employer_id: Employer.all.find_by(name: manager).id) 
        end
    end



end

