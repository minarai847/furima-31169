FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'a00000'}
    password_confirmation {password}
    first_name {"山田"}
    last_name {"隆太郎"}
    first_name_kana{"ヤマダ"}
    last_name_kana{"リクタロウ"}
    birthday{Faker::Date.birthday}

    
  end
end
