class CategoriesController < ApplicationController
  def show
    @pager = create_pager resources.order(created_at: :desc), page: params[:page]
    @posts = @pager.scoped
  end

  private

  def posts
    category.posts.published.includes(:categories, :categorizations, :user)
  end

  def category
    @category ||= Category.find_by(slug: params[:id])
  end
end
