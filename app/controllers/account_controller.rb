class AccountController < Account::BaseController
  def index
    if current_user
      @post = current_user.posts.build
      @posts = current_user.posts.order(:created_at).reverse_order
    else
      @user = User.new
    end
  end
end
