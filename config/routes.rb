Rails.application.routes.draw do

  root 'projects#dashboard'

  # Login/Registration Routes

  get '/assignees/welcome' => 'assignees#welcome'

  post '/assignees/register' => 'assignees#register'

  post '/assignees/login' => 'assignees#login'

  get '/assignees/logout' => 'assignees#logout'

  get '/clients/welcome' => 'clients#welcome'

  post '/clients/register' => 'clients#register'

  post '/clients/login' => 'clients#login'

  get '/clients/logout' => 'clients#logout'

  get '/admins/welcome' => 'admins#welcome'

  post '/admins/register' => 'admins#register'

  post '/admins/login' => 'admins#login'

  get '/admins/logout' => 'admins#logout'


  # Project Navigation Routes

  post '/projects/create' => 'projects#create'

  get '/projects/:p_id' => 'projects#project_sprints' 

  post '/projects/:p_id/create_sprint' => 'sprints#create'

  get '/projects/:p_id/sprints/:s_id' => 'sprints#sprint_requirements' 

  post '/projects/:p_id/sprints/:s_id/create_requirement' => 'requirements#create'

  get '/projects/:p_id/requirements' => 'projects#list_of_requirements' 

  get '/projects/dashboard' => 'projects#dashboard'

  # Payment Routes

  get '/payments/:reqID/request_payment/:payment_amount' => 'payments#request_payment'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
