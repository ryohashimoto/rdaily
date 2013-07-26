class Account::ReviewsController < Account::BaseController
  layout 'account'
  
  def index
    @reviews = resources.order("created_at desc").page(params[:page]).per(5)
  end

  def show
    @review = resources.find(params[:id])
  end

  def new
    @review = resources.build
  end

  def edit
    @review = resources.find(params[:id])
  end
  
  def create
    @review = resources.new(review_params)
    @review.user_id = current_user.id
    if @review.save!
      flash[:notice] = "Review is successfully created."
      redirect_to account_reviews_path
    else
      render :new
    end    
  end
  
  def update
    @review = resources.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "The review is successfully updated."
    else
      flash[:alert] = 'The review is not updated.'
    end
    redirect_to account_reviews_path
  end

  def destroy
    @review = resources.find(params[:id])
    if @review.destroy
      flash[:notice] = 'The review is successfully deleted.'
      redirect_to account_reviews_path
    end
  end
  
  def publish
    @review = resources.find(params[:id])
    policy = @review.published_policy
    unless policy.active?
      policy.activate!
    end
    redirect_to account_reviews_path
  end
  
  def unpublish
    @review = resources.find(params[:id])
    policy = @review.published_policy
    if policy.active?
      policy.stop!
    end
    redirect_to account_reviews_path
  end
  
  def search_product
    @amazon_service ||= AmazonService.new(params[:search][:index])
    @result = @amazon_service.search(params[:search][:keyword])
    respond_to do |format|
      format.json { render json: @result }
    end
  end

  private
  def resources
    current_user.reviews
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
