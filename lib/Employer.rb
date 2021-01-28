class Employer < ActiveRecord::Base

    has_many :employees

    def self.list
        self.all.index_by(&:name)
    end

    def my_reports
        self.employees.each {|employee| puts "#{employee.name}\n"}
        "have a nice day"
    end

end

