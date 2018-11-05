module Constraints
  YEARS = 1900..2100
  MONTHS = 1..12
  DAYS = 1..31

  class Year
    def matches?(request)
      params = request.params
      valid? params[:year].to_i
    end

    def valid?(year)
      YEARS.include?(year)
    end
  end

  class Month
    def matches?(request)
      params = request.params
      valid? params[:year].to_i, params[:month].to_i
    end

    def valid?(year, month)
      YEARS.include?(year) && MONTHS.include?(month)
    end
  end

  class Day
    def matches?(request)
      params = request.params
      valid? params[:year].to_i, params[:month].to_i, params[:day].to_i
    end

    def valid?(year, month, day)
      return false unless Month.new.valid?(year, month)
      return false unless DAYS.include?(day)
      begin
        Date.new(year, month, day)
        true
      rescue ArgumentError => e # フォーマットは正しいが実在しない日付(2/30など)の場合
        false
      end
    end
  end
end
