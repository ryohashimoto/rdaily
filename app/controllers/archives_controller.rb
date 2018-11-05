class ArchivesController < ApplicationController
  def year
    @year = params[:year].to_i
    return redirect_to year_archives_path(year: @year.to_s) unless canonical_year?
    @posts = resources.by_year(@year )
                      .order(:created_at).page(params[:page])
  end

  def month
    @year = params[:year].to_i
    @month = params[:month].to_i
    return redirect_to month_archives_path(year: @year.to_s, month: @month.to_s) unless canonical_month?
    @posts = resources.by_month(@year, @month)
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
end
