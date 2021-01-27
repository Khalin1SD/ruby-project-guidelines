class Employee < ActiveRecord::Base

    belongs_to :employer
    belongs_to :project
    has_many :employeeskills
    has_many :employeeprojects
    #has_many :skills
   

end
