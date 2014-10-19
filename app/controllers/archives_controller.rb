class ArchivesController < ApplicationController
  def index
    @posts = resources.order(created_at: :desc).page(params[:page]).per(5)
    @monthly_posts = @posts.group_by { |t| t.created_at.beginning_of_month }
  end

  private
  def resources
    Post.published.includes(:categories, :categorizations, :user)
  end
end
