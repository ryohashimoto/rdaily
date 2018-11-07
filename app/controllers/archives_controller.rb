class ArchivesController < ApplicationController
  def year
    redirect_to_canonical_year
    facade = Archives::YearFacade.new(params)
    retrieve facade, :year, :pager, :posts
  end

  def month
    redirect_to_canonical_month
    facade = Archives::MonthFacade.new(params)
    retrieve facade, :year, :month, :pager, :posts
  end

  def day
    redirect_to_canonical_day
    facade = Archives::DayFacade.new(params)
    retrieve facade, :year, :month, :day, :pager, :posts
  end

  private

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
