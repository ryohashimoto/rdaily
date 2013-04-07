class AccountController < ApplicationController
  def index
    @user = User.new
  end
end
