class Skill < ActiveRecord::Base

    has_many :employeeskills
    has_many :projectskills
    
    def self.least_common_skill
        lc_skill_id = Employeeskill.all.map { |employee| employee.skill_id}.uniq.min_by{ |i| Employeeskill.all.map { |employee| employee.skill_id}.count(i)}
        puts self.all.find(lc_skill_id).name
    end

    def self.lowest_competency
        this = {}
        this = self.all.collect {|skill| [skill,skill.employeeskills.sum {|item| item.competency}]}.to_h
        puts this.max_by{|k,v| v}[0].name
    end

    def self.add_new_skill(skill_name)
        new_skill = Skill.create(name: skill_name)
        puts "#{new_skill.name} has been added to the system."
    end

    def self.list
        self.all.index_by(&:name)
    end


end

