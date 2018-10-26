class Account::BaseController < ApplicationController
  before_action :authenticate_user!

  def authenticate_user!
    redirect_to login_path, alert: 'Please login.' unless current_user
  end
end
