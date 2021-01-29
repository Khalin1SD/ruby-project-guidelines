require_relative '../config/environment'


# #testing
# peter = Employee.all.first

# puts "Testing improve skill with exsiting skill"
# peter.improve_skill("Ruby")
# puts "Testing improve skill with new skill for employee"
# peter.improve_skill("Stapling")
# puts "Testing improve skill with new skill to system"
# peter.improve_skill("fix printer")

# puts "Testing list of employees with given skill"
# Employee.who_can_do_this?("Ruby")
# puts "Testing list of employees with given skill, that no one has"
# Employee.who_can_do_this?("Basket Weaving")

prompt = TTY::Prompt.new


def login
    puts "Welcome to TRACK"
    puts "The INITECH Employee Management System\n\n"
    prompt = TTY::Prompt.new
    pw = prompt.mask("Please enter password")
    if pw == "password"
        puts "Welcome"
        application
    else
        puts "Sorry, wrong password. Goodbye"
    end
end


def application

    employee_instance_methods = ["what_can_i_do?", "add_skill", "learn_new_skill", "improve_skill", "add_to_project", "employee_active_project"]
    employee_class_methods = ["who_can_do_this?"]
    employer_instance_methods = ["my_reports","hire_employee","fire_employee"]
    project_instance_methods = ["add_skill_requirement"]
    project_class_methods =["skills_requirement_not_met","skills_requirement_met", "requirements_gap"]
    skill_class_methods = ["least_common_skill","lowest_competency", "add_new_skill"]
    choice = "go"

    while choice != "EXIT" do

        prompt = TTY::Prompt.new
        methods_list = [{key: 1, name: "What skills does an employee have?", value: employee_instance_methods[0]},
        {key: 2, name: "Add a skill to an employee.", value: employee_instance_methods[1]},
        {key: 3, name: "Have employee learn a new skill.", value: employee_instance_methods[2]},
        {key: 4, name: "Have employee attend training.", value: employee_instance_methods[3]},
        {key: 5, name: "List employees that can do a certain skill.", value: employee_class_methods[0]},
        {key: 6, name: "Assign an employee to a project.", value: employee_instance_methods[4]},
        {key: 7, name: "Find out what an employee is working on", value: employee_instance_methods[5]},
        {key: 8, name: "Add a new skill to a projects requirements list.", value: project_instance_methods[0]},
        {key: 9, name: "List of projects who are sufficiently staffed.", value: project_class_methods[1]},
        {key: 10, name: "List of projects who’s team doesn’t  have enough skills in certain areas.", value: project_class_methods[0]},
        {key: 11, name: "List of projects with skills gaps and what those gaps are.", value: project_class_methods[2]},
        {key: 12, name: "List reports for a manager.", value: employer_instance_methods[0]},
        {key: 13, name: "Hire a new person.", value: employer_instance_methods[1]},
        {key: 14, name: "Fire someone.", value: employer_instance_methods[2]},
        {key: 15, name: "Identify the least common skill on the team.", value: skill_class_methods[0]},
        {key: 16, name: "Identify the skill the team is weakest in.", value: skill_class_methods[1]},
        {key: 17, name: "Add a new skill to the system.", value: skill_class_methods[2]},
        {key: 18, name: "Burn it all down.", value: "destroy_all"},        
        {key: 20, name: "Exit Application", value: "EXIT"}]


        choice = prompt.select("What would you like to do?", methods_list)

    



            if employee_instance_methods.any?(choice)

                list = Employee.list
                employee = prompt.select("Choose employee",list)
                if choice == employee_instance_methods[0] #what_can_i_do?
                    employee.send(employee_instance_methods[0])

                elsif choice == employee_instance_methods[5] #employee_active_project
                    employee.send(employee_instance_methods[5])

                elsif choice == employee_instance_methods[4] #add_to_project
                    list = Project.list
                    new_project = prompt.select("Choose a project",list)
                    employee.send(employee_instance_methods[4], new_project)

                else
                    list = Skill.list
                    skill = prompt.select("Choose a skill",list)
                    if choice == employee_instance_methods[1] #add_skill
                        puts "How good is #{employee.name} at #{skill.name}?"
                        comp = prompt.ask("Provide number in range: 1-10?") { |q| q.in("1-10")}
                        employee.send(employee_instance_methods[1], skill, comp)     
                    elsif choice == employee_instance_methods[2] #"learn_new_skill"
                        employee.send(employee_instance_methods[2], skill)
                    else
                        employee.send(employee_instance_methods[3], skill)
                    end
                end

            elsif employee_class_methods.any?(choice)
                if choice == "who_can_do_this?"
                    list = Skill.list
                    skill = prompt.select("Choose a skill",list)
                    Employee.who_can_do_this?(skill)
                end
            elsif employer_instance_methods.any?(choice)
                list = Employer.list
                manager = prompt.select("Choose a manager.",list)
                if choice == employer_instance_methods[0] #direct_reports
                    manager.send(employer_instance_methods[0])
                elsif choice == employer_instance_methods[1] #hire_employee
                    new_employee_name = prompt.ask("What is the new employee's name?")
                    manager.send(employer_instance_methods[1],new_employee_name)
                elsif choice == employer_instance_methods[2] #fire_employee
                    list = Employee.list
                    fired_employee = prompt.select("Choose employee to fire",list)
                    manager.send(employer_instance_methods[2],fired_employee)
                end
            elsif project_class_methods.any?(choice)
                project_class_methods.each do |class_method|
                    if choice == class_method
                        Project.send(class_method)
                    end
                end 
            elsif project_instance_methods.any?(choice)
                binding.pry
                project_instance_methods.each do |instance_method|
                    list = Project.list
                    project = prompt.select("Choose project",list)
                    list = Skill.list
                    skill = prompt.select("Choose the skill",list)
                    comp = prompt.ask("how good must they be at #{skill.name} range: 1-10?") { |q| q.in("1-10")}
                    binding.pry
                    if choice == instance_method
                        binding.pry
                        project.send(instance_method,skill,comp.to_i)
                    end
                end     
                         
            elsif skill_class_methods.any?(choice)
                if choice == skill_class_methods[2]
                    new_skill = prompt.ask("What is the new skill?")
                    Skill.send(skill_class_methods[2],new_skill)
                else
                    skill_class_methods.each do |class_method|
                        if choice == class_method
                            Skill.send(class_method)
                        end
                    end
                end

            end


            if choice =="destroy_all"
                #binding.pry
                puts "You should not have fired Milton"
                puts "Deleting all records...."
                sleep(1)
                puts "..."
                Employer.destroy_all
                Employee.destroy_all
                Skill.destroy_all
                Project.destroy_all
                Employeeskill.destroy_all
                Employeeproject.destroy_all
                Projectskill.destroy_all
                sleep(1)
                puts "Goodbye"
                return
            end

            sleep(1)
            puts "\n\n"

        end

        puts "Thanks, you are now logged off."
end

login
#application


# binding.pry
# puts "HELLO WORLD"


