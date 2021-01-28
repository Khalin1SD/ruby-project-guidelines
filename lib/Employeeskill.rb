class Employeeskill < ActiveRecord::Base

    belongs_to :skill
    belongs_to :employee


    def self.somthing

        # Employeeskill.all.select {|employee_skill| (Employeeskill.all.find(self.employee_id).skill_id => Employeeskill.all.find(self.employee_id).competency)}
    end


end
