class Employee < ActiveRecord::Base

    belongs_to :employer
    has_many :employeeskills
    has_many :skills, through: :employeeskills
    has_many :employeeprojects
    has_many :projects, through: :employeeprojects
    #belongs_to :project
    #has_many :skills


   

end
