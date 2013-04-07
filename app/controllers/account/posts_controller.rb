class Account::PostsController < ApplicationController
  def index
    @posts = current_user.posts.order(:created_at).reverse_order
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if params[:post]
      if params[:post][:published] == "1"
        @post.published_at = Time.now
        message = "Post is successfully published."
      elsif params[:post][:published] == "0"
        @post.published_at = nil
        message = "Post is not published now."
      end
      if @post.save && message
        flash[:notice] = message
        redirect_to account_path
      else
        redirect_to :action => :index
      end
    else
      redirect_to :action => :index
    end
  end
end
