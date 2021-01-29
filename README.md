# TRACK the Initech Employee Managemnt System

This system is designed to track Employees, skills and projects. The data structure is located in db/schema. The data can be reset by running rake db:seed in the terminal


The user interface is located in the run file and usess TTY prompt to displace a selection of choice to the user and guide them through modifying the dataset. A password is required to access the application. Currently the password cannot be reset, so don't forget it! (just kidding, its a hard coded value: password)

## The available methods are as follows. 

    "What skills does an employee have?" 
       This displays a list of the skills assoicated with a specific employee. 
       Runs the what_can_i_do? method on an employee instance

    "Add a skill to an employee." 
      This method adds a new skill to an employee and allows the user to define how good they are at it.
      Runs the add_skill method on an employee instance

    "Have employee learn a new skill." 
      This adds a new skill to an employee and sets their skill at 1 (beginner)
      Runs the learn_new_skill method on an employee instance

    "Have employee attend training." 
      This will increase the level of the selected employee and skill by 1
      Runs the improve_skill method on an employee instance

    "List employees that can do a certain skill." 
      Prints a list of employees that have the selected skill
      Runs the who_can_do_this? employee class method

    "Assign an employee to a project."
      Checks if employee is already assigned to project. Then (if requested) updates assignement to new project and sets old one as delayed.
      Runs add_to_project method on an employee instance
      
    "Find out what an employee is working on" 
      Prints the name of the project the employee is currently working on.
      Runs employee_active_project  method on an employee instance
  
    "Add a new skill to a projects requirements list." 

      project_instance_methods[0]
      
    "List of projects who are sufficiently staffed." 
      project_class_methods[1]
      
    "List of projects who’s team doesn’t  have enough skills in certain areas." 
      project_class_methods[0]
      
    "List of projects with skills gaps and what those gaps are." 
      project_class_methods[2]
      
    "List reports for a manager." 
      employer_instance_methods[0]
      
    "Hire a new person." 
      Creats new employee instance and saves to database. Note does not add skills or projects
      Runs
      employer_instance_methods[1]
      
    "Fire someone."
      Deletes records assoicated with specific employee in Employee, Employeeskills, and  Employeeprojects. Must select manager to fire someone.
      Runs fire_employee method on instance of manager.
      
    "Identify the least common skill on the team." 
      Prints the name of the skill that has the fewest number of team members has.
      Runs least_common_skill Skill class method.
      
    "Identify the skill the team is weakest in." 
      Prints the name of the skill that has the lowest total compency across all team members
      Runs lowest_competency Skill class method
      
    "Add a new skill to the system."
      Adds a new skill to the system.
      Runs add_new_skill Skill class method 
      
    "Burn it all down." 
      Deletes all data in the database. Runs destory_all on each table.
              
    "Exit Application" 
      Exits application



# Module One Final Project Guidelines

Congratulations you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. For example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributor's guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project. (2 minutes max)
6. Prepare a presentation to follow your video. (3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address what, if anything, you would change or add to what you have today.
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
