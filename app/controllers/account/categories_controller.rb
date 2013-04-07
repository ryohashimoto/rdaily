class Account::CategoriesController < ApplicationController
  def index
    @categories = resources.order('name asc')
  end

  def new
    @category = resources.new
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
    @category = resources.find(params[:id])
  end

  def update
    @category = resources.find(params[:id])
    if @params[:category] && @cateogry.update_attributes(params[:category])
      redirect_to account_categories_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @category = resources.find(params[:id])
    if @category.destroy
      redirect_to account_categories_path      
    end
  end

  def resources
    current_user.categories
  end
end
