class Account::PagesController < Account::BaseController
  layout 'account'
  
  def index
    @pages = resources.order("created_at desc").page(params[:page]).per(5)
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
    @page = resources.new(params[:page])
    if @page.save!
      flash[:notice] = "Page is successfully created."
      redirect_to account_pages_path
    else
      render :new
    end    
  end
  
  def update
    @page = resources.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "The page is successfully updated."
    else
      flash[:alert] = 'The page is not updated.'
    end
    redirect_to account_pages_path
  end
  
  def destroy
    @page = resources.find(params[:id])
    if @page.destroy
      flash[:notice] = 'The page is successfully deleted.'
      redirect_to account_pages_path
    end    
  end
  
  def publish
    @page = resources.find(params[:id])
    policy = @page.published_policy
    unless policy.active?
      policy.activate!
    end
    redirect_to account_pages_path
  end
  
  def unpublish
    @page = resources.find(params[:id])
    policy = @page.published_policy
    if policy.active?
      policy.stop!
    end
    redirect_to account_pages_path
  end
  
  private
  def resources
    current_user.pages
  end
end
