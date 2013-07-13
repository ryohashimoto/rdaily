class Account::CategoriesController < Account::BaseController
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]
  layout 'account'
  
  def index
    @categories = resources.order('name asc')
  end

  def new
    @category = resources.new
  end

  def show
    @posts = @category.posts
  end

  def create
    @category = resources.new(params[:category])
    if @category.save
      flash[:notice] = 'Category is successfully created.'
    else
      flash[:alert] = 'Category is not created.'
    end
    redirect_to account_categories_path
  end

  def edit
  end

  def update
    if @params[:category] && @cateogry.update_attributes(params[:category])
      redirect_to account_categories_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    if @category.destroy
      redirect_to account_categories_path      
    end
  end

  private
  def resources
    current_user.categories
  end

  def find_category
    @category ||= resources.find_by_slug(params[:id])
  end
end
