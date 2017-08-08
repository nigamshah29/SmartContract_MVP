# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

d1 = Date.new(2017, 7, 22)
d2 = Date.new(2017, 11, 11)
d3 = Date.new(2017, 6, 14)
d4 = Date.new(2017, 12, 22)


Admin.create(f_name:"Nigam", l_name:"Shah", email:"nigam129@gmail.com", password:"abcd", password_confirmation:"abcd")
Admin.create(f_name:"Alex", l_name:"Ford", email:"alex@builtbycoder.com", password:"abcd", password_confirmation:"abcd")
Admin.create(f_name:"Brian", l_name:"Shields", email:"brian@builtbycoder.com", password:"abcd", password_confirmation:"abcd")
Admin.create(f_name:"Jim", l_name:"Joyce", email:"jim@gmail.com", password:"abcd", password_confirmation:"abcd")

Client.create(f_name:"Microsoft", l_name:"Inc", email:"microsoft@gmail.com", password:"abcd", password_confirmation:"abcd")
Client.create(f_name:"Google", l_name:"Inc", email:"google@gmail.com", password:"abcd", password_confirmation:"abcd")
Client.create(f_name:"Apple", l_name:"Inc", email:"apple@gmail.com", password:"abcd", password_confirmation:"abcd")

Project.create(title:"Project1", project_type:"Startup", budget:800, admin_id:1, client_id:1)
Project.create(title:"Project2", project_type:"Accelerate", budget:800, admin_id:1, client_id:2)
Project.create(title:"Project3", project_type:"Enterprise", budget:800, admin_id:1, client_id:3)
Project.create(title:"Project4", project_type:"Small Business", budget:800, admin_id:1, client_id:4)
Project.create(title:"Project5", project_type:"Accelerate", budget:800, admin_id:1, client_id:5)
Project.create(title:"Project1-b", project_type:"Startup", budget:800, admin_id:2, client_id:1)
Project.create(title:"Project2-b", project_type:"Accelerate", budget:800, admin_id:2, client_id:2)

Sprint.create(project_id:6, start_date:d1, end_date:d2, status:"Not Started", progress:0)
Sprint.create(project_id:6, start_date:d3, end_date:d4, status:"In Progress", progress:25)
Sprint.create(project_id:6, start_date:d3, end_date:d1, status:"Complete", progress:100)
Sprint.create(project_id:6, start_date:d2, end_date:d4, status:"Blocked", progress:10)
Sprint.create(project_id:2, start_date:d1, end_date:d2, status:"Not Started", progress:0)
Sprint.create(project_id:2, start_date:d3, end_date:d4, status:"In Progress", progress:25)
Sprint.create(project_id:2, start_date:d3, end_date:d1, status:"Complete", progress:100)
Sprint.create(project_id:2, start_date:d2, end_date:d4, status:"Blocked", progress:10)
Sprint.create(project_id:3, start_date:d1, end_date:d2, status:"Not Started", progress:0)
Sprint.create(project_id:3, start_date:d3, end_date:d4, status:"In Progress", progress:25)
Sprint.create(project_id:3, start_date:d3, end_date:d1, status:"Complete", progress:100)
Sprint.create(project_id:3, start_date:d2, end_date:d4, status:"Blocked", progress:10)
Sprint.create(project_id:4, start_date:d1, end_date:d2, status:"Not Started", progress:0)
Sprint.create(project_id:4, start_date:d3, end_date:d4, status:"In Progress", progress:25)
Sprint.create(project_id:4, start_date:d3, end_date:d1, status:"Complete", progress:100)
Sprint.create(project_id:4, start_date:d2, end_date:d4, status:"Blocked", progress:10)

Requirement.create(sprint_id:6, expected_time:2, actual_time:1, statement:"As a user, I want to add different features", status:"In Progress")
Requirement.create(sprint_id:6, expected_time:1, actual_time:5, statement:"As a user, I want to remove different features", status:"In Progress")
Requirement.create(sprint_id:6, expected_time:3, actual_time:6, statement:"As a user, I want to make a rough sketch", status:"Not Started")
Requirement.create(sprint_id:6, expected_time:4, actual_time:2, statement:"As a user, I want to send screenshots", status:"Complete")
Requirement.create(sprint_id:6, expected_time:90000000, actual_time:1, statement:"As a user, I want to do everything Facebook can do", status:"Blocked")

Assignee.create(f_name:"Jim", l_name:"Joyce", email:"jim@gmail.com", password:"abcd", password_confirmation:"abcd", requirement_id:3, hourly_rate:50)
Assignee.create(f_name:"Manny", l_name:"Fresh", email:"manny@gmail.com", password:"abcd", password_confirmation:"abcd", requirement_id:1, hourly_rate:40)
Assignee.create(f_name:"Elsie", l_name:"Koglin", email:"elsie@gmail.com", password:"abcd", password_confirmation:"abcd", requirement_id:2, hourly_rate:45)
Assignee.create(f_name:"Danny", l_name:"M", email:"danny@gmail.com", password:"abcd", password_confirmation:"abcd", requirement_id:2, hourly_rate:45)

