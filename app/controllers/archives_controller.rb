class ArchivesController < ApplicationController
  def year
    @year = params[:year].to_i
    return redirect_to year_archives_path(year: @year) unless canonical_year?
    @posts = resources.by_year(@year)
                      .order(:created_at).page(params[:page])
  end

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i
    return redirect_to month_archives_path(year: @year, month: @month) \
      unless canonical_month?
    @posts = resources.by_month(@year, @month)
                      .order(:created_at).page(params[:page])
  end

  def day
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    date = canonical_date
    return redirect_to day_archives_path(year: date.year, month: date.month, day: date.day) \
      unless canonical_date?
    @posts = resources.by_day(@year, @month, @day)
                      .order(:created_at).page(params[:page])
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
end
