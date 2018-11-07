class ArchivesController < ApplicationController
  def year
    redirect_to_canonical_year
    @year = params[:year].to_i
    @pager = create_pager resources.by_year(@year).order(:created_at), page: params[:page]
    @posts = @pager.scoped
  end

  def month
    redirect_to_canonical_month
    @year = params[:year].to_i
    @month = params[:month].to_i
    @pager = create_pager resources.by_month(@year, @month).order(:created_at), page: params[:page]
    @posts = @pager.scoped
  end

  def day
    redirect_to_canonical_day
    facade = Archives::DayFacade.new(params)
    retrieve facade, :year, :month, :day, :pager, :posts
  end

  private

  def resources
    Post.published.includes(:categories, :categorizations, :user)
  end

  def canonical_year?
    params[:year].to_i.to_s == params[:year]
  end

  def canonical_month?
    canonical_year? && params[:month].to_i.to_s == params[:month]
  end

  def canonical_date
    @canonical_date ||= Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
  end

  def canonical_date?
    date = canonical_date
    date.year.to_s == params[:year] && date.month.to_s == params[:month] &&
      date.day.to_s == params[:day]
  end

  def redirect_to_canonical_year
    return redirect_to year_archives_path(year: params[:year].to_i) unless canonical_year?
  end

  def redirect_to_canonical_month
    return redirect_to month_archives_path(year: params[:year].to_i, month: params[:month].to_i) \
      unless canonical_month?
  end

  def redirect_to_canonical_day
    date = canonical_date
    redirect_to day_archives_path(year: date.year, month: date.month, day: date.day) \
      unless canonical_date?
  end
end
