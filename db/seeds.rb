# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do
    listing = Listing.create(
        title: Faker::Vehicle.make_and_model + " " + Faker::Vehicle.year.to_s,
        default_daily_rate: Faker::Number.decimal(2).to_d,
        image_url: Faker::Avatar.image("my-own-slug")
    )
    listing.seasonal_rates.create(
        start_date: Faker::Date.between(2.days.ago, Date.today),
        end_date: Faker::Date.between(Date.today, 2.days.from_now),
        daily_rate: Faker::Number.decimal(3, 2).to_d
    )
end
