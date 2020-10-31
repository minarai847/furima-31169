FactoryBot.define do
  factory :item do
    name{Faker::Lorem.sentence}
    description{Faker::Lorem.sentence}
    category_id{2}
    item_condition_id{2}
    shipping_charges_id{2}
    shipping_area_id{2}
    days_to_ship_id{2}
    price{700}
    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end
