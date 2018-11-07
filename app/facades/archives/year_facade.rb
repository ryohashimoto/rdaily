class Archives::YearFacade < ApplicationFacade
  def year
    params[:year].to_i
  end

  def pager
    @pager ||= pager_for resources.by_year(year).order(:created_at), page: params[:page]
  end

  def posts
    pager.scoped
  end

  private

  def resources
    Post.published.includes(:categories, :categorizations, :user)
  end
end
