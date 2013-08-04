class PagesController < ApplicationController

  def show
    @page = resources.find_by(slug: params[:id])
  end
  
  private
  def resources
    Page.where("published_at is not null")
  end
end
