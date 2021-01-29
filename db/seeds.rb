Employer.destroy_all
Employee.destroy_all
Skill.destroy_all
Project.destroy_all

Employeeskill.destroy_all
Employeeproject.destroy_all
Projectskill.destroy_all


employer1 = Employer.create(name: "Bill Lumbergh")
employer2 = Employer.create(name: "Does Not Care")


employee1 = Employee.create(name: "Peter Gibbons",employer_id: employer1.id)
employee2 = Employee.create(name: "Michael Bolton",employer_id: employer1.id)
employee3 = Employee.create(name: "Samir Nagheenanajar",employer_id: employer1.id)
employee4 = Employee.create(name: "Milton",employer_id: employer1.id)
employee5 = Employee.create(name: "Bob Slydel",employer_id: employer2.id)
employee5 = Employee.create(name: "Bob Porter",employer_id: employer2.id)

skill1 = Skill.create(name: "Ruby")
skill2 = Skill.create(name: "SQL")
skill3 = Skill.create(name: "C#")
skill4 = Skill.create(name: "TPS Reports")
skill5 = Skill.create(name: "Staple")

project1 = Project.create(name: "Skim Money")
project2 = Project.create(name: "File TPS Reports")
project3 = Project.create(name: "Destroy Printer")
project4 = Project.create(name: "Reorganize")

##Setup Employee Skills##

#give Peter Skills
employee_skill1 = Employeeskill.create(employee_id:employee1.id, skill_id: skill1.id, competency: 8)
employee_skill2 = Employeeskill.create(employee_id:employee1.id, skill_id: skill2.id, competency: 8)
employee_skill3 = Employeeskill.create(employee_id:employee1.id, skill_id: skill3.id, competency: 8)
employee_skill4 = Employeeskill.create(employee_id:employee1.id, skill_id: skill4.id, competency: 1)
#give Michale Skills
employee_skill5 = Employeeskill.create(employee_id:employee2.id, skill_id: skill1.id, competency: 5)
employee_skill6 = Employeeskill.create(employee_id:employee2.id, skill_id: skill2.id, competency: 6)
employee_skill7 = Employeeskill.create(employee_id:employee2.id, skill_id: skill3.id, competency: 2)
#give Samir Skills

#give Milton Skills
employee_skill8 = Employeeskill.create(employee_id:employee4.id, skill_id: skill5.id, competency: 10)


##Setup project skills##

#skim money
project_skill1 = Projectskill.create(project_id: project1.id, skill_id: skill1.id, competency_requirement: 8)
project_skill2 = Projectskill.create(project_id: project1.id, skill_id: skill2.id, competency_requirement: 6)
project_skill3 = Projectskill.create(project_id: project1.id, skill_id: skill3.id, competency_requirement: 8)

#file TPS report
project_skill4 = Projectskill.create(project_id: project2.id, skill_id: skill4.id, competency_requirement: 2)


##Setup Employee Projects##

#Skim Money#
employee_project_1 = Employeeproject.create(employee_id: employee1.id, project_id: project1.id, status: "Active")
employee_project_4 = Employeeproject.create(employee_id: employee1.id, project_id: project2.id, status: "Inactive")
employee_project_2 = Employeeproject.create(employee_id: employee2.id, project_id: project2.id, status: "Active")
employee_project_3 = Employeeproject.create(employee_id: employee3.id, project_id: project3.id, status: "Active")





