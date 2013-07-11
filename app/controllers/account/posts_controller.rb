class Account::PostsController < Account::BaseController
  def index
    @posts = resources.order(:created_at).reverse_order
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
    if post_form.category_ids
      post_form.category_ids.each do |category_id|
        categorization = @post.categorizations.build
        categorization.category_id = category_id
        categorization.save!
      end
    end
    if @post.save!
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    post_form = ::Account::PostForm.new(params[:post])
    binding.pry
    @post = resources.find(params[:id])
    if post_form.category_ids
      prev_category_ids = @post.categories.map(&:id)
      (post_form.category_ids - prev_category_ids).each do |category_id|
        categorization = @post.categorizations.build
        categorization.category_id = category_id
        categorization.save!
      end
      (prev_category_ids - post_form.category_ids).each do |category_id|
        categorization = @post.categorizations.find_by_category_id(category_id)
        categorization.destroy
      end
    end
    post_params = post_form.to_params
    binding.pry
    if @post.update_attributes(post_params)
      flash[:notice] = "The post is successfully updated."
    else
      flash[:alert] = 'Post is not updated.'
    end
    redirect_to account_path
  end

  def destroy
    @post = resources.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Post is successfully deleted.'
      redirect_to account_path
    end
  end

  private
  def resources
    current_user.posts
  end
end
