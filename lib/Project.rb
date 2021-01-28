class Project < ActiveRecord::Base

    # belongs_to :employers
    # has_many :employees
    has_many :projectskills
    has_many :employeeprojects
    has_many :skills, through: :projectskills
    has_many :employees, through: :employeeprojects
    
    # def self.skills_requirement_met
        
    #     #need to itterate through each project and find difference between skills_requirements method and team_skills method

    #     self.all.each do |project|
    #         h1 = self.skills_requirements
    #         h2 = self.team_skills
    #         binding.pry
    #         h1.dup.delete_if { |k,_| h2.key?(k) }
    #         binding.pry
    #     end


    # end

    def skills_requirements
        skills_with_require = {}
        requirements_list = self.projectskills.map {|link| link.competency_requirement}
        skills_list = self.projectskills.map {|link| Skill.find(link.skill_id).name}
        skills_list.zip(requirements_list) {|skills,require| skills_with_require[skills] = require}
        skills_with_require
    end

    def team_skills
        self.employees.map {|team_member| team_member.what_can_i_do_operations}
    end




end
   