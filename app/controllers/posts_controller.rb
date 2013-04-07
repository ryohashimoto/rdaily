class PostsController < ApplicationController

  def index
    @posts = resources.order(:created_at).reverse_order
  end

  def show
    @post = resources.find(params[:id])
  end

  private
  def resources
    Post.published
  end
end
