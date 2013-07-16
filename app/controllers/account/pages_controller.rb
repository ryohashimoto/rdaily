class Account::PagesController < Account::BaseController
  layout 'account'
  
  def index
  end
  
  def show
  end
  
  def new    
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def publish
  end
  
  def unpublish
  end
  
  private
  def resources
    current_user.pages
  end
end
