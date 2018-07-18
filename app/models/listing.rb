class Listing < ApplicationRecord
    # Association
    has_one :seasonal_rate
    # Validations
    validates :title, :default_daily_rate, :image_url, :available, presence: true
    validates :default_daily_rate, numericality: true
    validates :available, inclusion: { in: [ true, false ] }
    # Pagination per page value
    self.per_page = 16
end
