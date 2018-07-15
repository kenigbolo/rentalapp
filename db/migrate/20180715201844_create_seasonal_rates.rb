class CreateSeasonalRates < ActiveRecord::Migration[5.2]
  def change
    create_table :seasonal_rates, id: :uuid do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
