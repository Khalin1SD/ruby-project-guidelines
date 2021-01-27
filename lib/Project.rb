class Project < ActiveRecord::Base

    # belongs_to :employers
    # has_many :employees
    has_many :projectskills
    has_many :employeeprojects
    has_many :skills, through: :projectskills
    has_many :employees, through: :employeeprojects
    

end
   