class RegistrationInteractor < ApplicationInteractor
  attr_reader :user

  def initialize(params)
    @user = params[:user]
  end

  def execute
    return fail! unless user.save
    page = user.pages.new(new_page_params)
    return fail! unless page.save
    success!
  end

  private

  def new_page_params
    {
      title: "About",
      body: "You can modify this page in account/pages menu.",
      slug: "about",
      published_at: Time.current
    }
  end
end
