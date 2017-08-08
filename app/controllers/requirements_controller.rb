class RequirementsController < ApplicationController

  def create
  	sprint_id = params[:s_id]
  	project_id = params[:p_id]
  	@r = Requirement.create(sprint_id:sprint_id, expected_time:params[:expected_time], statement:params[:statement])
  	redirect_to "/projects/#{project_id}/sprints/#{sprint_id}"
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

  def destroy
  end

end
