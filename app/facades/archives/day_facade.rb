class Archives::DayFacade < ApplicationFacade
  def year
    params[:year].to_i
  end

  def month
    params[:month].to_i
  end

  def day
    params[:day].to_i
  end

  def pager
    @pager ||= create_pager resources.by_day(year, month, day).order(:created_at), page: params[:page]
  end

  def posts
    pager.scoped
  end

  private

  def resources
    Post.published.includes(:categories, :categorizations, :user)
  end
end
