FactoryBot.define do
  factory :seasonal_rate do
    listing
    start_date Faker::Date.between(2.days.ago, Date.today)
    end_date Faker::Date.between(Date.today, 2.days.from_now)
    daily_rate Faker::Number.decimal(3, 2).to_d
  end
end
