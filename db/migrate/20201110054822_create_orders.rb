class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_code, presence: true
      t.integer :prefecture_id, presence: true
      t.string :city, presence: true
      t.string :address, presence: true
      t.string :building_name
      t.string :phone_number, presence: true
      t.references :purchase, presence: true, foreign_key:true
      t.timestamps
    end
  end
end
