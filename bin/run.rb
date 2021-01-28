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
    #askes for user name, check against managers
    prompt = TTY::Prompt.new
    pw = prompt.mask("Enter Password")
    if pw == "password"
        puts "Welcome"
        application
    else
        puts "Sorry, wrong password. Goodbye"
    end
end


# prompt.ask("What is your name?", default: ENV["USER"])

# prompt.yes?("are you sure?")

def application
    prompt = TTY::Prompt.new
    methods_list = [{key: 1, name: "What skills does an employee have?", value: "what_can_i_do?"},
     {key: 2, name: "Add a skill to an employee.", value: "add_skill"},
     {key: 3, name: "Have employee learn a new skill.", value: "learn_new_skill"},
     {key: 4, name: "Have employee attend training.", value: "improve_skill"},
     ]
    choice = prompt.select("What would you like to do?", methods_list)
        #binding.pry

        employee_instance_methods = ["what_can_i_do?", "add_skill", "learn_new_skill", "improve_skill"]

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
                    puts "Congradulations #{employee.name} can now #{skill.name}"
                elsif choice == "learn_new_skill"
                    binding.pry
                    employee.learn_new_skill(skill)
                else
                    employee.improve_skill(skill)
                end
            end
        end

        puts "end of application"
end

#login
#application


binding.pry
puts "HELLO WORLD"


