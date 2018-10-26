class Account::CategoriesController < Account::BaseController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  layout 'account'

  def index
    @categories = resources.order(:name)
  end

  def new
    @category = resources.new
  end

  def show
    @posts = @category.posts
  end

  def create
    @category = resources.new(category_params)
    return render :new unless @category.save

    @categories = resources
  end

  def edit; end

  def update
    if @cateogry.update_attributes(category_params)
      redirect_to account_categories_path
    else
      render action: :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'The category was successfully deleted.'
      redirect_to account_categories_path
    end
  end

  def cancel; end

  private

  def resources
    current_user.categories
  end

  def find_category
    @category ||= resources.find_by(slug: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
