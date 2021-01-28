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
    choice = "go"
    while choice != "EXIT" do

        prompt = TTY::Prompt.new
        methods_list = [{key: 1, name: "What skills does an employee have?", value: "what_can_i_do?"},
        {key: 2, name: "Add a skill to an employee.", value: "add_skill"},
        {key: 3, name: "Have employee learn a new skill.", value: "learn_new_skill"},
        {key: 4, name: "Have employee attend training.", value: "improve_skill"},
        {key: 5, name: "List employees that can do a certian skill.", value: "who_can_do_this?"},
        {key: 6, name: "List of projects who are sufficently staffed.", value: "skills_requirement_met"},
        {key: 7, name: "List of projects whos team dones not have enough skills in certain areas.", value: "skills_requirement_not_met"},
        {key: 8, name: "List of projects with skills gaps and what those gaps are.", value: "requirements_gap"},
        {key: 9, name: "List reports for a manager.", value: "my_reports"},
        {key: 20, name: "Exit Application", value: "EXIT"}
        ]
        choice = prompt.select("What would you like to do?", methods_list)
            #binding.pry

            employee_instance_methods = ["what_can_i_do?", "add_skill", "learn_new_skill", "improve_skill"]
            employee_class_methods = ["who_can_do_this?"]
            project_class_methods =["skills_requirement_not_met","skills_requirement_met", "requirements_gap"]
            employer_instance_methods = ["my_reports"]

            #what_can_i_do?, add_skill(skill, comp), learn_new_skill(skill), improve_skill(skill)
            if employee_instance_methods.any?(choice)
                #binding.pry
                list = Employee.list
                employee = prompt.select("Choose employee",list)
                if choice == "what_can_i_do?"
                    employee.what_can_i_do?
                else
                    list = Skill.list
                    #list.push("New Skill") ## should add "New Skill to hash"
                    skill = prompt.select("Choose a skill",list)
                    if choice == "add_skill"
                        puts "How good is #{employee.name} at #{skill.name}?"
                        comp = prompt.ask("Provide number in range: 1-10?") { |q| q.in("1-10")}
                        employee.add_skill(skill,comp)
                        
                    elsif choice == "learn_new_skill"
                        employee.learn_new_skill(skill)
                    else
                        employee.improve_skill(skill)
                    end
                end
            elsif employee_class_methods.any?(choice)
                if choice == "who_can_do_this?"
                    list = Skill.list
                    skill = prompt.select("Choose a skill",list)
                    Employee.who_can_do_this?(skill)
                end
            elsif project_class_methods.any?(choice)
                if choice == "skills_requirement_not_met"
                    Project.skills_requirement_not_met
                elsif choice == "skills_requirement_met"
                    Project.skills_requirement_met
                else
                    Project.requirements_gap
                end
            elsif employer_instance_methods.any?(choice)
                if choice == "my_reports"
                    list = Employer.list
                    manager = prompt.select("Choose a manager.",list)
                    manager.my_reports
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


