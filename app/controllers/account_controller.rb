class AccountController < Account::BaseController
  layout 'account'
  
  def index
    if current_user
      @post = current_user.posts.build
      @posts = current_user.posts.order(created_at: :desc).limit(5)
    end
  end
end
