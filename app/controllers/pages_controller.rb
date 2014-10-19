class PagesController < ApplicationController

  def show
    @page = resources.find_by(slug: params[:id])
  end
  
  private
  def resources
    Page.published.includes(:user)
  end
end
