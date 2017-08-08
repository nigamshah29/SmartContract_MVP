class SprintsController < ApplicationController

  def create
	@s = Sprint.create(project_id:params[:p_id], start_date:params[:start_date], end_date:params[:end_date])
  	redirect_to "/projects/#{params[:p_id]}"
  end

  def sprint_requirements
	  @sprint = Sprint.find(params[:s_id])
  	@requirements = Requirement.where(sprint_id: params[:s_id])
    if @sprint.project.project_type == "Accelerate"
      @project_rate = 75
    elsif @sprint.project.project_type == "Startup"
      @project_rate = 125
    elsif @sprint.project.project_type == "Small Business"
      @project_rate = 150
    else
      @project_rate = 200
    end
  end

  def update
  end

  def destroy
  end
end
