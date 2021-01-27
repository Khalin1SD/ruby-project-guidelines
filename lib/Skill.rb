class Skill < ActiveRecord::Base

    has_many :employeeskills
    has_many :projectskills
    

end

