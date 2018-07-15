class SeasonalRate < ApplicationRecord
  belongs_to :listing
  validates :start_date, :end_date, :daily_rate, presence: true
  validates :daily_rate, numericality: true
  validates :listing, presence: true
end
