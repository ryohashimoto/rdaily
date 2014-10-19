class CategoriesController < ApplicationController

  def show
    @posts = posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  private
  def posts
    category.posts.published.includes(:categories, :categorizations, :user)
  end

  def category
    @category ||= Category.find_by(slug: params[:id])
  end
end
