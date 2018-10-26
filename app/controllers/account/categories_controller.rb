class Account::CategoriesController < Account::BaseController
  layout "account"

  def index
    @categories = resources.order(:name)
  end

  def new
    @category = resources.new
  end

  def show
    @category = resources.find_by(slug: params[:id])
    @posts = @category.posts
  end

  def create
    @category = resources.new(category_params)
    if @category.save
      flash[:notice] = "Category is successfully created."
      redirect_to account_categories_path
    else
      render :new
    end
  end

  def edit
    @category = resources.find_by(slug: params[:id])
  end

  def update
    @category = resources.find_by(slug: params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category is successfully updated."
      redirect_to account_categories_path
    else
      render action: :edit
    end
  end

  def destroy
    @category = resources.find_by(slug: params[:id])
    if @category.destroy
      flash[:notice] = "The category was successfully deleted."
      redirect_to account_categories_path
    end
  end

  def cancel; end

  private

  def resources
    current_user.categories
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
