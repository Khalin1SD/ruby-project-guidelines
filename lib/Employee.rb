class Employee < ActiveRecord::Base
    belongs_to :Employer
    has_many :employeeskills
    has_one :project
    #name, id, project_id

    

end

