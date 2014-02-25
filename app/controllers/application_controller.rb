class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def page_not_found
    render 'errors/not_found'
  end

  def server_error
    render 'errors/server_error'
  end

  helper_method :current_user
end
