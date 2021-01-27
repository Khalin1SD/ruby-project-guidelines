Employer.destroy_all
Employee.destroy_all
Skill.destroy_all
Project.destroy_all

Employeeskill.destroy_all
#EmployeeProjects.destroy_all
#ProjectSkills.destroy_all


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
skill4 = Skill.create(name: "Filing TPS Reports")
skill5 = Skill.create(name: "Stapling")

project1 = Project.create(name: "Skim Money")
project2 = Project.create(name: "File TPS Reports")
project3 = Project.create(name: "Destroy Printer")
project4 = Project.create(name: "Reorganize")

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

#Setup project skills
#project_skill1 = ProjectSkill


