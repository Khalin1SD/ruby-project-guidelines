class Employee < ActiveRecord::Base

    belongs_to :employer
    has_many :employeeskills
    has_many :skills, through: :employeeskills
    has_many :employeeprojects
    has_many :projects, through: :employeeprojects
    #belongs_to :project
    #has_many :skills

    def add_skill(skill, comp)
        if Skill.all.map {|this| this.name}.include?("#{skill}") == false
        puts "Sorry skill does not exist. See below."
        puts Skill.all.map {|that| that.name}
        
        elsif (Skill.all.map {|this| this.name}.include?("#{skill}") == true) && (self.skills.find_by(name: skill))
            puts "Already has skill"
            
            # self.skills.find_by(name: skill)
            
        else
            this_skill = Skill.all.find_by(name: "#{skill}").id
            Employeeskill.create(employee_id:self.id, skill_id: this_skill, competency: comp)
        end

    end

   

end
