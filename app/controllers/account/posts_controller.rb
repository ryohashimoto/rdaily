class Account::PostsController < Account::BaseController
  layout 'account'
  
  def index
    @posts = resources.order("created_at desc").page(params[:page]).per(5)
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
    post_form = ::Account::PostForm.new(params[:post])    
    @post = resources.new(post_form.to_params)
    @post.user_id = current_user.id
    @post.categorization_builder.build_from(post_form.category_ids)
    if @post.save!
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    post_form = ::Account::PostForm.new(params[:post])
    @post = resources.find(params[:id])
    post_params = post_form.to_params
    @post.categorization_builder.update_from(post_form.category_ids)    
    if @post.update_attributes(post_params)
      flash[:notice] = "The post is successfully updated."
    else
      flash[:alert] = 'The post is not updated.'
    end
    redirect_to account_path
  end

  def destroy
    @post = resources.find(params[:id])
    if @post.destroy
      flash[:notice] = 'The post is successfully deleted.'
      redirect_to account_path
    end
  end
  
  def publish
    @post = resources.find(params[:id])
    policy = @post.published_policy
    unless policy.active?
      policy.activate!
    end
    redirect_to account_path
  end
  
  def unpublish
    @post = resources.find(params[:id])
    policy = @post.published_policy
    if policy.active?
      policy.stop!
    end
    redirect_to account_path
  end

  private
  def resources
    current_user.posts
  end
end
