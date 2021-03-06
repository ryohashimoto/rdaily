class ApplicationController < ActionController::Base
  include ActionFacade::Retrieval
  include ActionPager::Pagination

  protect_from_forgery

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def allow_new_user?
    @allow_new_user ||= User.count.zero?
  end

  def page_not_found
    render "errors/not_found"
  end

  def server_error
    render "errors/server_error"
  end

  helper_method :current_user, :allow_new_user?
end
