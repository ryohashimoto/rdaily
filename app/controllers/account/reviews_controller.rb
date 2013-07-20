class Account::ReviewsController < ApplicationController
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
  end

  private
  def resources
    current_user.reviews
  end

  def review_params
    params.require(:review).permit(:title, :body)
  end
end
