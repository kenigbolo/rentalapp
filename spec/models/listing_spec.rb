require 'rails_helper'

RSpec.describe Listing, type: :model do
  before(:all) do
    @listing1 = create(:listing)
  end
  context `valid factory` do
    it 'creates a valid listing object' do
      expect(@listing1).to be_valid
    end
    it 'builds a listing object' do
      expect(build(:listing)).to be_valid
    end
  end

  context `checks for presence of required string fields` do
    it 'checks for the presence of title' do
      expect { create(:listing, title: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'checks for the presence of image url' do
      expect { create(:listing, image_url: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context `checks for boolean value` do
    it 'checks that the available field is a valid boolean' do
      expect(create(:listing).available).to be_in([true, false])
    end
  end

  context `checks for numericality of default daily rate field` do
    it 'throws error of the default daily rate field isnt a decimal' do
      expect(create(:listing).default_daily_rate.class).to eq(BigDecimal)
    end
  end
end
