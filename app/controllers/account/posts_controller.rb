class Account::PostsController < Account::BaseController
  layout "account"

  def index
    @posts = resources.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    @post = resources.find(params[:id])
  end

  def new
    @post = resources.build
  end

  def edit
    @post = resources.find(params[:id])
  end

  def create
    @post = resources.new(post_params)
    if @post.save
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    @post = resources.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "The post is successfully updated."
      redirect_to account_path
    else
      render :edit
    end
  end

  def destroy
    @post = resources.find(params[:id])
    if @post.destroy
      flash[:notice] = "The post is successfully deleted."
      redirect_to account_path
    end
  end

  def publish
    @post = resources.find(params[:id])
    @post.publish if @post.unpublished?
    redirect_to account_path
  end

  def unpublish
    @post = resources.find(params[:id])
    @post.unpublish if @post.published?
    redirect_to account_path
  end

  private

  def resources
    current_user.posts.includes(:categories, :categorizations, :user)
  end

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
  end
end
