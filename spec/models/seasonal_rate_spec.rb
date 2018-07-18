require 'spec_helper'
require 'rails_helper'
RSpec.describe SeasonalRate, type: :model do
  context `valid factory` do
    it 'creates a valid seasonal rate object' do
      expect(create(:seasonal_rate)).to be_valid
    end
    it 'builds a listing object' do
      expect(build(:seasonal_rate)).to be_valid
    end
  end

  context `checks for numericality of seasonal daily rate field` do
    it 'checks that seasonal daily rate is a decimal' do
      expect(create(:seasonal_rate).daily_rate.class).to eq(BigDecimal)
    end
  end

  context `checks for proper of dates` do
    it 'checks for validity of start date object' do
      expect(create(:seasonal_rate).start_date.class).to eq(Date)
    end
    it 'checks for validity of end date object' do
      expect(create(:seasonal_rate).end_date.class).to eq(Date)
    end
  end

  context `checks that one to one relationship` do
    it 'checks that there is a valid referenced listing' do
      expect(create(:seasonal_rate).listing.class).to eq(Listing)
    end
  end
end
