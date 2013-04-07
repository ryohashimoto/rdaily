class PostsController < ApplicationController

  def index
    @posts = Post.published.order(:created_at).reverse_order
  end
end
