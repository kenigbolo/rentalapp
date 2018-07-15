class Listing < ApplicationRecord
    has_many :seasonal_rates
    validates :title, :default_daily_rate, :image_url, presence: true
    validates :default_daily_rate, numericality: true
end
