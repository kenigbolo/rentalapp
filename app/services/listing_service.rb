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
    return include_seasonal_prices if date_includes_seasonal?
    daily_rate_result
  end

    private

  def load_listing(listing)
    @listing = listing
  end

  def load_seasonal_rate
    @seasonal_rate = listing.seasonal_rate
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
    seasonal_rate_result + daily_rate_result
  end

  def seasonal_rate_result
    seasonal_rates_matches = num_of_seasonal_rates_days
    seasonal_rates_matches * seasonal_rate.daily_rate
  end

  def daily_rate_result
    return no_seasonal_price if num_of_seasonal_rates_days.zero?
    return 0 if same_day_seasonal_rates?
    daily_rate_matches = seasonal_range_checker.length - num_of_seasonal_rates_days
    daily_rate_matches * listing.default_daily_rate
  end

  # Cases where the following are valid
  # Seasonal rates have the same start and end date
  def same_day_seasonal_rates?
    seasonal_rate.end_date == seasonal_rate.start_date
  end

  def num_of_seasonal_rates_days
    seasonal_range_checker.count(true)
  end

  def no_seasonal_price
    return listing.default_daily_rate if end_date == start_date
    (end_date - start_date) * listing.default_daily_rate
  end
end
