class PagesController < ApplicationController

  def show
    @post = resources.find(params[:id])
  end
  
  private
  def resources
    Page.published
  end
end
