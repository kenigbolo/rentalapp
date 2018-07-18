200.times do
  listing = Listing.create(
    title: Faker::Vehicle.make_and_model + " " + Faker::Vehicle.year.to_s,
    default_daily_rate: Faker::Number.decimal(2).to_d,
    image_url: 'https://res.cloudinary.com/hqxyevlf6/image/upload/c_fill,h_391,w_637/v1528205335/toak6kpvz32nvcdckvjn.jpg',
    available: Faker::Boolean.boolean
  )
  listing.seasonal_rate.create(
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.between(Date.today, 2.days.from_now),
    daily_rate: Faker::Number.decimal(3, 2).to_d
  )
end
