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
  end
  
  def update
  end

  private
  def resources
    current_user.reviews
  end
end
