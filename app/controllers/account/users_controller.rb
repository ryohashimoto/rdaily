class Account::UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      builder = AboutPageBuilder.new(@user)
      builder.create_page
      UserMailer.registered(@user).deliver_later!(wait: 1.minutes)
      flash.notice = "User is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
