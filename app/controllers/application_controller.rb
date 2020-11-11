class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #if @current_user is present it prevents the code from hitting the database making the code more efficient
  end

  def logged_in?
    !!current_user
    #turning current_user value to boolean
  end

  def require_user
    if !logged_in?
      flash[:notice] = "you must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
