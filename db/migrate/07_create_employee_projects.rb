class CreateEmployeeProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :employeeprojects do |t|
      t.integer :employee_id, :foreign_key => true 
      t.integer :project_id, :foreign_key => true 
      t.string :status
    end
  end
end
