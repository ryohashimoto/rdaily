class PagesController < ApplicationController

  def show
    @page = resources.find_by_slug!(params[:id])
  end
  
  private
  def resources
    Page.published
  end
end
