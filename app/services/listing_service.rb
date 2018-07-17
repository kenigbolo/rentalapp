class ListingService
    attr_reader :start_date, :end_date, :listing, :seasonal_rate

    def initialize(search_params)
        @start_date = Date.parse search_params[:start_date]
        @end_date = Date.parse search_params[:end_date]
        @listing = nil
        @seasonal_rate = nil
    end

    def calculate_price(listing)
      load_listing(listing)
      load_seasonal_rate
    #   byebug
      return include_seasonal_prices if date_includes_seasonal?
      no_seasonal_price
    end

    private

    def load_listing(listing)
      @listing = listing
    end

    def load_seasonal_rate
      @seasonal_rate = listing.seasonal_rates.first
    end

    def date_includes_seasonal?
      seasonal_range_checker.include? true
    end

    def seasonal_range_checker
      seasonal_range = seasonal_rate.start_date..seasonal_rate.end_date
      search_range = start_date..end_date
      search_range.map{ |day| seasonal_range === day }
    end

    def include_seasonal_prices
      seasonal_rates_matches = seasonal_range_checker.count(true)
      seasonal_rates_calculation = seasonal_rates_matches * seasonal_rate.daily_rate
      daily_rate_matches = seasonal_range_checker.length - seasonal_rates_matches
      daily_rate_calculation = daily_rate_matches * listing.default_daily_rate
      seasonal_rates_calculation + daily_rate_calculation
    end
    
    def no_seasonal_price
      return listing.default_daily_rate if end_date == start_date
      (end_date - start_date) * listing.default_daily_rate
    end
end