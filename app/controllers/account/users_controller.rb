class Account::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash.notice = "User is successfully created."
      redirect_to root_path
    end
  end
end
