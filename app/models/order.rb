class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, with: /\A\d{11}\z/ } 
    validates :purchase
  end
end
