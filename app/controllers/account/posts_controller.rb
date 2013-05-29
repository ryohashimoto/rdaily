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
    if params[:post][:category_ids] && params[:post][:category_ids] != "0"
      category_ids = []
      category_ids = params[:post][:category_ids].split(',')
      category_ids.map! { |category_id| category_id.to_i }
      category_ids.shift
    end
    params[:post].delete(:category_ids)
    @post = resources.new(params[:post])
    @post.user_id = current_user.id
    if category_ids
      category_ids.each do |category_id|
        categorization = @post.categorizations.build
        categorization.category_id = category_id
        categorization.save!
      end
    end
    if @post.save!
      expire_page post_path(@post)
      expire_pages category_ids
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    @post = resources.find(params[:id])
    if params[:post]
      if params[:post][:published] == "1"
        @post.published_at = Time.now
        message = "Post is successfully published."
      elsif params[:post][:published] == "0"
        @post.published_at = nil
        message = "Post is not published now."
      end
      params[:post].delete(:published) if params[:post][:published]
      if @post.update_attributes(params[:post])
        expire_page post_path(@post)
        expire_pages @post.categories(&:id)
        if message
          flash[:notice] = message
        else
          flash[:notice] = "The post is successfully updated."
        end
      else
        flash[:alert] = 'Post is not updated.'
      end
    else
      flash[:alert] = 'Post is not updated.'
    end
    redirect_to account_path
  end

  def destroy
    @post = resources.find(params[:id])
    if @post.destroy
      expire_pages(@post.category_ids(&:id))
      flash[:notice] = 'Post is successfully deleted.'
      redirect_to account_path
    end
  end

  private
  def resources
    current_user.posts
  end

  def expire_pages(category_ids)
    expire_page '/'
    if category_ids.present?
      category_ids.each do |category_id|
        category = Category.find(category_id)
        if category
          expire_page "/categories/#{category.id}"
          expire_page "/categories/#{category.slug}"
        end
      end
    end
  end
end
