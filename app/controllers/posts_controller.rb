class PostsController < ApplicationController
  def index
    @posts = resources.order("created_at desc").page(params[:page]).per(5)
    @monthly_posts = monthly_posts
  end

  def show
    @post = resources.find(params[:id])
    @monthly_posts = monthly_posts
  end

  def feed
    @title = "Rdaily"
    @posts = resources.order("created_at desc")
    @updated = @posts.maximum(:updated_at)
    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom),
        :status => :moved_permanently }
    end
  end

  private
  def resources
    Post.where("published_at is not null")
  end

  def monthly_posts
    @monthly_posts ||=  resources.order("created_at desc").limit(10).group_by { |t| t.created_at.beginning_of_month }
  end
end
