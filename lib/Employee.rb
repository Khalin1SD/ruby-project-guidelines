class Employee < ActiveRecord::Base

    belongs_to :employer
    belongs_to :project
    has_many :skills
   

end
