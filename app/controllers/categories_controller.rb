class CategoriesController < ApplicationController

  def show
    @posts = resources.page(params[:page]).per(5)
  end

  private
  def resources
    category.posts.where("published_at is not null").order("created_at desc")
  end

  def category
    @category ||= Category.find_by(slug: params[:id])
  end
end
