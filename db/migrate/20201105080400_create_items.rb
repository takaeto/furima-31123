class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, presence: true
      t.text :description, presence: true
      t.integer :category_id, presence: true
      t.integer :condition_id, presence: true
      t.integer :postage_payer_id, presence: true
      t.integer :prefecture_id, presence: true
      t.integer :ship_date_id, presence: true
      t.integer :price, presence: true
      t.references :user, presence: true, foreign_key:true
      t.timestamps
    end
  end
end
