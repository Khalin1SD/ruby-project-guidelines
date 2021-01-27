class Project < ActiveRecord::Base

    belongs_to :employers
    has_many :employees



end
   