class ProjectsController < ApplicationController

	def create
		@p = Project.create(title:params[:title], project_type:params[:project_type], budget:params[:budget], admin_id:session[:admin_id], client_id:session[:client_id])
      	redirect_to "/dashboard"
	end

	# def index
	# 	if current_client && current_admin
	# 		@projects = Project.all
	# 		render "dashboard" and return
	# 	else current_client
	# 		redirect_to '/admins/welcome' and return
	# 	else
	# 		redirect_to '/clients/welcome' and return
	# 	end
	# end

	def dashboard
		@projects = Project.all
	end

	def project_sprints
		@project = Project.find(params[:p_id])
		@sprints = Sprint.where(project_id: params[:p_id])
	end

	def list_of_requirements
		@project = Project.find(params[:p_id])
		@sprints = Sprint.where(project_id: params[:p_id])
		@requirements = []
		@sprints.each do |s|
  			@requirements += s.requirements
		end
	    if @project.project_type == "Accelerate"
	      @project_rate = 75
	    elsif @project.project_type == "Startup"
	      @project_rate = 125
	    elsif @project.project_type == "Small Business"
	      @project_rate = 150
	    else
	      @project_rate = 200
	    end
	end

end
