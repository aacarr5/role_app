class SessionsController < ApplicationController

	def new
		@session = Session.new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:id] = user.id
			redirect_to '/'
		else
			redirect_to new_session_path
		end
	end

	def destroy
		session[:id] = nil
		redirect_to '/'
	end

end
