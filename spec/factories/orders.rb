FactoryBot.define do
  factory :order do
    post_code { "555-0000"}
    prefecture_id { "2" }
    city { "仙台市" }
    address { "1-2-3" }
    building_name { "志ら梅ビル" }
    phone_number { "09012345678" }
  end
end
