class Employee < ActiveRecord::Base

    belongs_to :employer
    has_many :employeeskills
    has_many :skills, through: :employeeskills
    has_many :employeeprojects
    has_many :projects, through: :employeeprojects
    #belongs_to :project
    #has_many :skills

    def self.who_can_do_this?(this_skill)
        #takes in the name of a skill (string) and prints the list of employee names

        employee_list = Employee.joins(:skills).where(skills: {name: this_skill})
        employee_list.each {|employee| puts employee.name}
        #binding.pry
    end


    def what_can_i_do?

        skills_with_comp = {}
        competency_list = self.employeeskills.map {|link| link.competency}
        skills_list = self.employeeskills.map {|link| Skill.find(link.skill_id).name}
        skills_list.zip(competency_list) {|skills,comp| skills_with_comp[skills] = comp}

        puts self.name + "\n"
        x=skills_list.length
        i=0
        x.times do
            puts skills_list[i].to_s + "\t" + competency_list[i].to_s
            i+=1
        end

        skills_with_comp
    end


   

end
