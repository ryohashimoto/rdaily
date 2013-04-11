class Account::BaseController < ApplicationController
  before_filter :authenticate_user!

  def authenticate_user!
    unless current_user
      redirect_to login_path, :alert => 'Please login.'
    end
  end
end
