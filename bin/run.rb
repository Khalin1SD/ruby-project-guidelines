require_relative '../config/environment'


#testing
peter = Employee.all.first

puts "Testing improve skill with exsiting skill"
peter.improve_skill("Ruby")
puts "Testing improve skill with new skill for employee"
peter.improve_skill("Stapling")
puts "Testing improve skill with new skill to system"
peter.improve_skill("fix printer")

puts "Testing list of employees with given skill"
Employee.who_can_do_this?("Ruby")
puts "Testing list of employees with given skill, that no one has"
Employee.who_can_do_this?("Basket Weaving")



binding.pry
puts "HELLO WORLD"


