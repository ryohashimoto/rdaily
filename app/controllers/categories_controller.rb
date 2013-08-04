class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show]

  def show
    @posts = @category.posts.published
  end

  private
  def find_category
    @category ||= Category.find_by(slug: params[:id])
  end
end
