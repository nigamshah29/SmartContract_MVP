class AdminsController < ApplicationController
  def index
    if current_admin
      redirect_to '/'
    else
      redirect_to '/admins/welcome'
    end
  end

  def welcome
  end

  def login
    admin = Admin.find_by(email:params[:email])
    if admin
      if admin.authenticate params[:password]
        session[:admin_id] = admin.id
        redirect_to '/'
      else
        flash[:message] = ["Admin password is incorrect"]
        redirect_to "/admins/welcome"
      end
    else
      flash[:message] = ["Admin does not exist"]
      redirect_to "/admins/welcome"
    end
  end

  def register
    admin = Admin.create(f_name:params[:first_name], l_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if admin.valid?
      admin.save
      session[:admin_id] = admin.id
      redirect_to '/'
    else
      flash[:message] = admin.errors.full_messages
      redirect_to '/admins/welcome'
    end
  end

  def logout
    reset_session
    redirect_to "/admins/welcome"
  end
end
