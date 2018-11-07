class Account::PagesController < Account::BaseController
  layout "account"

  def index
    @pager = pager_for resources.order(created_at: :desc), page: params[:page]
    @pages = @pager.scoped
  end

  def show
    @page = resources.find(params[:id])
  end

  def new
    @page = resources.build
  end

  def edit
    @page = resources.find(params[:id])
  end

  def create
    @page = resources.new(page_params)
    if @page.save
      flash[:notice] = "Page is successfully created."
      redirect_to account_pages_path
    else
      render :new
    end
  end

  def update
    @page = resources.find(params[:id])
    if @page.update(page_params)
      flash[:notice] = "The page is successfully updated."
      redirect_to account_pages_path
    else
      flash[:alert] = "The page is not updated."
      render :edit
    end
  end

  def destroy
    @page = resources.find(params[:id])
    if @page.destroy
      flash[:notice] = "The page is successfully deleted."
      redirect_to account_pages_path
    end
  end

  def publish
    @page = resources.find(params[:id])
    @page.publish if @page.unpublished?
    redirect_to account_pages_path
  end

  def unpublish
    @page = resources.find(params[:id])
    @page.unpublish if @page.published?
    redirect_to account_pages_path
  end

  private

  def resources
    current_user.pages.includes(:user)
  end

  def page_params
    params.require(:page).permit(:title, :body, :slug)
  end
end
