class Employee < ActiveRecord::Base

    belongs_to :employer
    has_many :employeeskills
    has_many :skills, through: :employeeskills
    has_many :employeeprojects
    has_many :projects, through: :employeeprojects


    #method list
        #Class methods
            #list, who_can_do_this(skill_name), 
        #instance methods
            #improve_skill(skill_name), learn_new_skill(skill_name), what_can_i_do?, add_skill(skill,comp)


# Class Methods            
    def self.list
        self.all.index_by(&:name)
    end

    def self.who_can_do_this?(this_skill)
        #takes in the name of a skill (string) and prints the list of employee names
        
        #convert this_skill string to object
        skill_object = Skill.find_by(name: this_skill)

        #check if skill exists
        if skill_object
            #check if skill assigned to anyone
            if Employeeskill.find_by(skill_id: skill_object.id)
                #if assigned to someone, get list of employees and print
                employee_list = Employee.joins(:skills).where(skills: {name: this_skill})
                employee_list.each {|employee| puts employee.name}
            else
                puts "Nope, no one can do that"
            end
        else
            puts "Never even heard of #{this_skill}"
        end
    end

#Instance Methods

    def improve_skill(skill)
        #improves skill comptancy by 1 and replaces active project
        training_skill = Skill.all.find_by(name:skill)
        if training_skill
            if self.skills.find {|skill| skill == training_skill}
                self.employeeskills.find_by(skill_id: training_skill.id).competency += 1
            else
                puts "Employee does not have this skill."

                puts "Would you like to add it?(Y,N)"
                #####  .gets WILL THROW ERROR IN PRY #####
                answer = gets.chomp
                if answer == "Y"
                    self.learn_new_skill(skill)
                else
                    puts "Your the boss"
                end  
            end
        else
            self.new_skill_via_method(skill)
        end
    end

    def learn_new_skill(skill)
        #improves skill comptancy by 1 and replaces active project
        training_skill = Skill.all.find_by(name:skill)
        if training_skill
            puts "Ummm, I'm gonna need you to go ahead come in tomorrow and learn how to #{training_skill.name}"
            employeeskills.create(employee_id: self.id, skill_id: training_skill.id, competency: 1)
        else
            self.new_skill_via_method(skill)
        end
    end

    def what_can_i_do?
        skills_with_comp = self.what_can_i_do_operations
        skills_with_comp.each do |key,value|
            puts key + "\t\t" + value.to_s
        end
    end

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

#Methods to be accessed by other methods

    def competency_array
        #produces array of employee competency in order of Skill_id
        #0 is inserted if employee does not have this skill
        competency_array = []
        Skill.all.each do |skill|
            if self.employeeskills.find_by(skill_id: skill.id)
                competency_array << self.employeeskills.find_by(skill_id: skill.id).competency
            else
                competency_array << 0
            end
        end
        competency_array
    end

    def what_can_i_do_operations
        skills_with_comp = {}
        competency_list = self.employeeskills.map {|link| link.competency}
        skills_list = self.employeeskills.map {|link| Skill.find(link.skill_id).name}
        skills_list.zip(competency_list) {|skills,comp| skills_with_comp[skills] = comp}
        skills_with_comp
    end

    def new_skill_via_method(skill)
        puts "This skill is not currently in our system"
        puts "Would you like to add it? (Y,N)"
        #####  .gets WILL THROW ERROR IN PRY #####
        answer = gets.chomp
        if answer == "Y"
            puts "Ummm, I'm gonna need you to go ahead come in tomorrow and learn how to #{skill}"
            new_skill = Skill.create(name: skill)
            Employeeskill.create(employee_id: self.id, skill_id: new_skill.id, competency: 1)
        else
            puts "Your the boss"
        end
    end

   

end
