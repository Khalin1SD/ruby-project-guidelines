class Project < ActiveRecord::Base

    # belongs_to :employers
    # has_many :employees
    has_many :projectskills
    has_many :employeeprojects
    has_many :skills, through: :projectskills
    has_many :employees, through: :employeeprojects
    
    def self.skills_requirement_met
        requirement = Projects


    end

    def skills_requirements
        binding.pry
        requirements = self.projectskills
    end

    def team_skills
        self.employees.map {|team_member| team_member.what_can_i_do_operations}
    end





end
   