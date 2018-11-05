module Constraints
  YEARS = 1900..2100
  MONTHS = 1..12

  class Year
    def matches?(request)
      ::Constraints::YEARS.include?(request.params[:year].to_i)
    end
  end

  class YearMonth
    def matches?(request)
      ::Constraints::MIN_YEAR..MAX_YEAR.include?(request.params[:year].to_i) &&
        ::Constraints::MONTHS.include?(request.params[:month].to_i)
    end
  end
end
