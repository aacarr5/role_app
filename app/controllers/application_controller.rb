class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?, :check_user

  def current_user
    @current_user ||= User.find_by(id:session[:id])
  end

  def logged_in?
	 	current_user != nil
  end

  def check_user
    return if !params[:user_id]
    if current_user.id != params[:user_id].to_i
      redirect_to '/'
    end
  end


end
