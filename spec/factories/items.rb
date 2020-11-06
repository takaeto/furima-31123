FactoryBot.define do
  factory :item do
    name { "仕事服" }
    description { "スーツ" }
    category_id { '2' }
    condition_id { '2' }
    postage_payer_id { '2' }
    prefecture_id { '2' }
    ship_date_id { '2' }
    price { '1000' }
    association :user
  end
end
