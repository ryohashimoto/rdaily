class PagesController < ApplicationController

  def show
    @page = resources.find(params[:id])
  end
  
  private
  def resources
    Page.published
  end
end
