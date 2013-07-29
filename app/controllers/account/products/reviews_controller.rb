class Account::Products::ReviewsController < Account::BaseController
  
  def new
    @review = resources.new(asin: params[:product_id])
    @product_params = amazon_service.lookup(params[:product_id])
  end
  
  def create    
    @review = resources.new(review_params)
    if @review.save!
      amazon_service.store(review_params[:asin])
      flash[:notice] = "Review is successfully created."
      redirect_to account_reviews_path
    else
      render :new
    end    
  end
  
  private
  def resources
    current_user.reviews
  end
  
  def review_params
    params.require(:review).permit(:title, :body, :asin)
  end

  def amazon_service
    @amazon_service ||= AmazonService.new('All')
  end
end
