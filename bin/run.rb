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
    prompt = TTY::Prompt.new
    pw = prompt.mask("Enter Password")
    if pw == "password"
        puts "Welcome"
        application
    else
        puts "Sorry, wrong password. Goodbye"
    end
end


def application

    employee_instance_methods = ["what_can_i_do?", "add_skill", "learn_new_skill", "improve_skill"]
    employee_class_methods = ["who_can_do_this?"]
    employer_instance_methods = ["my_reports","hire_employee"]
    project_instance_methods = ["add_skill_requirement"]
    project_class_methods =["skills_requirement_not_met","skills_requirement_met", "requirements_gap"]
    skill_class_methods = ["least_common_skill","lowest_competency"]
    choice = "go"

    while choice != "EXIT" do

        prompt = TTY::Prompt.new
        methods_list = [{key: 1, name: "What skills does an employee have?", value: employee_instance_methods[0]},
        {key: 2, name: "Add a skill to an employee.", value: employee_instance_methods[1]},
        {key: 3, name: "Have employee learn a new skill.", value: employee_instance_methods[2]},
        {key: 4, name: "Have employee attend training.", value: employee_instance_methods[3]},
        {key: 5, name: "List employees that can do a certian skill.", value: employee_class_methods[0]},
        {key: 5, name: "Add a new skill to a projects requirements list.", value: project_instance_methods[0]},
        {key: 6, name: "List of projects who are sufficently staffed.", value: project_class_methods[1]},
        {key: 7, name: "List of projects whos team dones not have enough skills in certain areas.", value: project_class_methods[0]},
        {key: 8, name: "List of projects with skills gaps and what those gaps are.", value: project_class_methods[2]},
        {key: 9, name: "List reports for a manager.", value: employer_instance_methods[0]},
        {key: 10, name: "Hire a new person.", value: employer_instance_methods[1]},
        {key: 11, name: "Identify the least common skill on the team.", value: skill_class_methods[0]},
        {key: 12, name: "Identify the skill the team is weakest in.", value: skill_class_methods[1]},        
        {key: 20, name: "Exit Application", value: "EXIT"}]

        choice = prompt.select("What would you like to do?", methods_list)


            if employee_instance_methods.any?(choice)
                #binding.pry
                list = Employee.list
                employee = prompt.select("Choose employee",list)
                if choice == employee_instance_methods[0] #what_can_i_do?
                    employee.send(employee_instance_methods[0])
                else
                    list = Skill.list
                    skill = prompt.select("Choose a skill",list)
                    if choice == employee_instance_methods[1] #add_skill
                        puts "How good is #{employee.name} at #{skill.name}?"
                        comp = prompt.ask("Provide number in range: 1-10?") { |q| q.in("1-10")}
                        employee..send(employee_instance_methods[1], skill, comp)     
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
                if choice == "my_reports"
                    list = Employer.list
                    manager = prompt.select("Choose a manager.",list)
                    manager.my_reports
                elsif choice == "hire_employee"
                    list = Employer.list
                    manager = prompt.select("Choose a manager.",list)
                    new_employee_name = prompt.ask("What is the new employee's name?")
                    manager.hire_employee(new_employee_name)
                end
            elsif project_class_methods.any?(choice)
                project_class_methods.each do |class_method|
                    if choice == class_method
                        Project.send(class_method)
                    end
                end
            elsif skill_class_methods.any?(choice)
                skill_class_methods.each do |class_method|
                    if choice == class_method
                        Skill.send(class_method)
                    end
                end

            end

            sleep(1)
            puts "\n\n"

        end

        puts "Thanks, you are now logged off."
end

#login
#application


binding.pry
puts "HELLO WORLD"


