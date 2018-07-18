require 'rails_helper'

RSpec.describe ListingsHelper, type: :helper do
  before(:all) do
    @listing = create(:listing)
  end

  context `It checks availability` do
    it 'returns yes when availability is true' do
      expect(helper.availability(@listing)).to eq('Yes')
    end

    it 'returns no when availability is false' do
      @listing.available = false
      expect(helper.availability(@listing)).to eq('No')
    end
  end
end
