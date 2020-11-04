FactoryBot.define do
  factory :user do
    nickname { "eto" }
    email { Faker::Internet.free_email }
    password { "w1w1w1" }
    password_confirmation { password }
    last_name { "鈴木" }
    first_name { "亜久里" }
    last_name_kana { "スズキ" }
    first_name_kana { "アグリ" }
    birth_date { "1960-9-8" }
  end
end
