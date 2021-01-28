class Skill < ActiveRecord::Base

    has_many :employeeskills
    has_many :projectskills
    
    def self.list
        self.all.index_by(&:name)
    end

end

