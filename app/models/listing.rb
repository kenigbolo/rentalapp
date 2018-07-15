class Listing < ApplicationRecord
    has_many :seasonal_rates
    validates :title, :default_rate, presence: true
    validates :default_rate, numericality: true
end
