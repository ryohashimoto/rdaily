class Account::PostsController < ApplicationController
  def index
    @posts = current_user.posts.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      redirect_to :action => :index
    else
      render :new
    end
  end
end
