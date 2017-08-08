class ClientsController < ApplicationController

  def index
    if current_client
      redirect_to '/'
    else
      redirect_to '/clients/welcome'
    end
  end

  def welcome
  end

  def login
    client = Client.find_by(email:params[:email])
    if client
      if client.authenticate params[:password]
        session[:client_id] = client.id
        redirect_to '/'
      else
        flash[:message] = ["Client password is incorrect"]
        redirect_to "/clients/welcome"
      end
    else
      flash[:message] = ["Client does not exist"]
      redirect_to "/clients/welcome"
    end
  end

  def register
    client = Client.create(f_name:params[:first_name], l_name:params[:last_name], email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])
    if client.valid?
      client.save
      session[:client_id] = client.id
      redirect_to '/'
    else
      flash[:message] = client.errors.full_messages
      redirect_to '/clients/welcome'
    end
  end

  def logout
    reset_session
    redirect_to "/clients/welcome"
  end

end
