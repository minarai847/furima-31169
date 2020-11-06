FactoryBot.define do
  factory :user_order do
   
    post_code{'000-0000'}
    shipping_area_id{'3'}
    municipalities{"横浜"}
    address_number{'1111'}
    phone_number{'00000000000'}
  end
end
