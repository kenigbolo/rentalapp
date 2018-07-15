class AddListingToSeasonalRates < ActiveRecord::Migration[5.2]
  def change
    add_reference :seasonal_rates, :listing, type: :uuid, foreign_key: true
  end
end