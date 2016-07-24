class UsersController < ApplicationController

	before_action :check_user

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to '/'
		else
			binding.pry
			redirect_to new_user_path @user
		end
	end

	def edit
	end

	def delete
	end

	private

	def user_params
		params.require(:user).permit(:email,:password,:password_confirmation,:role)
	end
end
