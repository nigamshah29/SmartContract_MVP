class AssigneesController < ApplicationController
  
  def index
    if current_assignee
      redirect_to '/'
    else
      redirect_to '/assignees/welcome'
    end
  end

  def welcome
  end

  def login
    assignee = assignee.find_by(email:params[:email])
    if assignee
      if assignee.authenticate params[:password]
        session[:assignee_id] = assignee.id
        redirect_to '/'
      else
        flash[:message] = ["Assignee password is incorrect"]
        redirect_to "/assignees/welcome"
      end
    else
      flash[:message] = ["Assignee does not exist"]
      redirect_to "/assignees/welcome"
    end
  end

  def register
    assignee = Assignee.create(f_name:params[:first_name], l_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if assignee.valid?
      assignee.save
      session[:assignee_id] = assignee.id
      redirect_to '/'
    else
      flash[:message] = assignee.errors.full_messages
      redirect_to '/assignees/welcome'
    end
  end

  def logout
    reset_session
    redirect_to "/assignees/welcome"
  end

end
