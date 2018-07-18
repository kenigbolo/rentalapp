FactoryBot.define do
  factory :listing do
    title { Faker::Vehicle.make_and_model + ' ' + Faker::Vehicle.year.to_s }
    default_daily_rate { Faker::Number.decimal(2).to_d }
    available { true }
    image_url { 'someurl' }
  end
end
