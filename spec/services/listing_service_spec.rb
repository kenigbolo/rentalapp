require 'rails_helper'

RSpec.describe ListingsHelper do
  before(:all) do
    search_params = {
      start_date: Date.today.to_s, end_date: (Date.today + 1).to_s
    }
    @service = ListingService.new(search_params)
    @seasonal_rate = create(:seasonal_rate)
    @listing = @seasonal_rate.listing
  end

  context `It is a service object` do
    it 'instantiates a service object' do
      expect(@service.class).to eq(ListingService)
    end
  end

  context `It have methods available` do
    it 'responds to the calculate price method' do
      expect(@service).to respond_to(:calculate_price)
    end
  end

  context `calculates correct price` do
    it 'returns the correct price for same day search query' do
      date = Date.today + 2
      seasonal_rate = create(:seasonal_rate, start_date: date, end_date: date)
      listing = seasonal_rate.listing
      price = listing.default_daily_rate
      expect(@service.calculate_price(listing)).to eq(price)
    end

    it 'returns the correct price for one day search query' do
      date = Date.today + 2
      seasonal_rate = create(:seasonal_rate, start_date: date, end_date: date + 1)
      listing = seasonal_rate.listing
      price = listing.default_daily_rate
      expect(@service.calculate_price(listing)).to eq(price)
    end

    it 'returns correct price for seasonal rate calculation' do
      date = Date.today + 1
      seasonal_rate = create(:seasonal_rate, start_date: date, end_date: date)
      listing = seasonal_rate.listing
      price = seasonal_rate.daily_rate
      expect(@service.calculate_price(listing)).to eq(price)
    end

    it 'returns correct price for seasonal and normal date rate calculation' do
      date = Date.today + 1
      seasonal_rate = create(:seasonal_rate, start_date: date, end_date: date + 1)
      listing = seasonal_rate.listing
      price = seasonal_rate.daily_rate + listing.default_daily_rate
      expect(@service.calculate_price(listing)).to eq(price)
    end
  end
end
