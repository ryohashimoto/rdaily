class AccountController < Account::BaseController
  layout 'account'

  def index
    if current_user
      @post = posts.build
      @posts = posts.order(created_at: :desc).limit(5)
    end
  end

  private

  def posts
    current_user.posts.includes(:categories, :categorizations, :user)
  end
end
