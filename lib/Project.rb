class Project < ActiveRecord::Base

    has_many :projectskills
    has_many :employeeprojects
    has_many :skills, through: :projectskills
    has_many :employees, through: :employeeprojects

## Class Methods ##
    def self.list
        self.all.index_by(&:name)
    end


   def self.skills_requirement_not_met
        #calls skills_requiremlent array and requests the list of projects that
        #do meet the skills requirements
        requirements_not_met =[]
        requirements_not_met = skills_requirements("not met")
        puts "Thes the team on these projects don't have enough skills:\n"
        requirements_not_met.each do |project|
            puts project.name
        end
        requirements_not_met
    end

    def self.skills_requirement_met
        #calls skills_requiremlent array and requests the list of projects that have people assigned
        #and meet the skills requirements
        requirements_met =[]
        requirements_met = skills_requirements("met")

        puts "The projects are sufficiently staffed:\n"
        requirements_met.each do |project|
            puts project.name
        end
        requirements_met
    end

    def self.requirements_gap
        #return list of projects not meeting their requirements WITH the missing skills and how much they are missing
        skills_list = Skill.all.map {|skill| skill.name}
        project_list = self.skills_requirements("not_met")
        project_list.each do |project|
            if project.projectskills.length == 0
                puts "\n" + project.name +  "\n\nNo skill requirements assigned\n\n"
            else
                #build array that shows difference between team skills and project requirements
                #skills_list = project.projectskills.map {|link| Skill.find(link.skill_id).name}
                project_requirements_array = project.requirement_array
                team_competency_array = project.team_competency
                difference_array = [team_competency_array,project_requirements_array].transpose.map {|x| x.reduce(:-)}
                
                #itterate through differenc array and pull out skills that are lacking
                
                puts "\n" + project.name +  "\n\nSkill\t\tdefficiency\n\n"
                
                i=0

                if project.employees.length >0
                    #if project is staffed
                    difference_array.length.times do
                        #binding.pry
                        if difference_array[i] < 0
                            puts skills_list[i] +"\t\t"+ difference_array[i].to_s
                        end
                        i += 1
                    end
                else
                    difference_array.length.times do
                        puts skills_list[i] +"\t\t"+ difference_array[i].to_s
                        i += 1
                    end
                end
            end

        end
    end

    def add_skill_requirement(skill,requirement)
        #takes in a skill name (string) and a competency_requirment (integer) and adds the requirement to the project
        skill_object = Skill.all.find_by(name: skill)

        if skill_object and requirement.is_a? Integer #does the skill exist and is the requirement an intege?
            Projectskill.create(project_id: self.id, skill_id: skill_object.id, competency_requirement: requirement)
        elsif skill_object #testing if the skill exists (if it does, the issue was with the requirement)
            puts "The skill level required must be an integer"
        else
            #if the skill does not exist in the system does the user want to add it?
            puts "This skill is not currently in our system"
            puts "Would you like to add it? (Y,N)"
            #####  .gets WILL THROW ERROR IN PRY #####
            answer = gets.chomp
            if answer == "Y"
                puts "Okey Dokey, adding it."
                skill_object = Skill.create(name: skill)
                Projectskill.create(project_id: self.id, skill_id: skill_object.id, competency_requirement: requirement)
            else
                puts "Your the boss"
            end
        end
    end


#methods to be called by other methods

    def self.skills_requirements(met_or_not)
        #Method builds array or competency_requirment and array of team member competency then get difference.
        requirements_met =[]
        requirements_not_met = []

        self.all.each do |project|
            if project.employees.length >0 #check to see if anyone is assigned, if true builds arrays
                project_requirements_array = project.requirement_array
                team_competency_array = project.team_competency
                difference_array = [team_competency_array,project_requirements_array].transpose.map {|x| x.reduce(:-)}
                if difference_array.min >= 0 # if difference_array has any number less than zero project goes into not_meet array
                    requirements_met << project
                else
                    requirements_not_met << project
                end
            else
                requirements_not_met << project
            end
        end

        #based upon the variable passed, returns the requested array.
        if met_or_not == "met"
            return requirements_met
        else
            return requirements_not_met 
        end
    end

    def requirement_array
        #produces array of project requirements competency in order of Skill_id
        #0 is inserted if employee does not have this skill
        project_competency_array = []
        Skill.all.each do |skill|
            if self.projectskills.find_by(skill_id: skill.id)
                project_competency_array << self.projectskills.find_by(skill_id: skill.id).competency_requirement
            else
                project_competency_array << 0
            end
        end
        project_competency_array
    end

    def team_competency
        #make array where each index corrisponds to a skill in system. Sum team skills in each index
        skill_name_array = Skill.all.map {|skill| skill.name}
        team_competency_array = Skill.all.map {|skill| 0}

        team_skill_array = self.employees.each do |team_member|
            team_competency_array = [team_competency_array,team_member.competency_array].transpose.map {|x| x.reduce(:+)}
        end
        team_competency_array
    end


    def self.create_project(title) #project
        Project.create(name: title)
    end


end
   