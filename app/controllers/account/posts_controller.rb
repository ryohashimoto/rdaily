class Account::PostsController < ApplicationController
  def index
    @posts = resources.order(:created_at).reverse_order
  end

  def new
    @post = resources.build
  end

  def create
    @post = resources.new(params[:post])
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post is successfully created."
      redirect_to account_path
    else
      render :new
    end
  end

  def update
    @post = resources.find(params[:id])
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
      else
        flash[:alert] = 'Post is not updated.'
      end
    else
      flash[:alert] = 'Post is not updated.'
    end
    redirect_to account_path
  end

  def destroy
    @post = resources.find(params[:id])
    if @post.destroy
      flash[:notice] = 'Post is successfully deleted.'
      redirect_to account_path
    end
  end

  private
  def resources
    current_user.posts
  end
end
