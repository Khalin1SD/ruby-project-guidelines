class Skill < ActiveRecord::Base

    has_many :employeeskills
    has_many :projectskills
    
    def self.least_common_skill
        lc_skill_id = Employeeskill.all.map { |employee| employee.skill_id}.uniq.min_by{ |i| Employeeskill.all.map { |employee| employee.skill_id}.count(i)}
        Skill.all.find(lc_skill_id).name
    end

    # Skill.all.select { |skill| skill.sum {|item| item.compentency}}

    def self.lowest_competency
        this = {}
        this = Skill.all.collect {|skill| [skill,skill.employeeskills.sum {|item| item.competency}]}.to_h
            # binding.pry
            puts this.max_by{|k,v| v}[0].name
            #skill.employeeskills.sum {|item| item.competency}

    end


#          Skill.all.self.employeeskills











end

