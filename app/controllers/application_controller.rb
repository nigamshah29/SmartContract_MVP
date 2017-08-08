class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def current_client
		@c = Client.find_by_id(session[:client_id]) if session[:client_id]
		if @c.nil?
		  redirect_to '/welcome'
		else
		  return @c
		end
	end

	def current_admin
		@a = Admin.find_by_id(session[:admin_id]) if session[:admin_id]
		if @a.nil?
		  redirect_to '/welcome'
		else
		  return @a
		end
	end

	def current_assignee
		@asg = Assignee.find_by_id(session[:assignee_id]) if session[:assignee_id]
		if @asg.nil?
		  redirect_to '/welcome'
		else
		  return @asg
		end
	end


  helper_method :current_client, :current_admin, :current_assignee

end
