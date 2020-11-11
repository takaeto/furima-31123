class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :ship_date

  with_options presence: true do
    validates :category_id, :condition_id, :postage_payer_id, :prefecture_id, :ship_date_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end
end
