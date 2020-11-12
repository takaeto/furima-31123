class OrderDonation

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, with: /\A\d{11}\z/ } 
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, city: city, address: address, phone_number: phone_number, prefecture_id: prefecture_id, purchase_id: purchase.id )
  end

end