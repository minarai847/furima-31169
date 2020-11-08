class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code ,null: false
      t.string :municipalities, null: false
      t.integer :shipping_area_id,  null: false
      t.string :address_number, null: false
      t.string :phone_number , null: false
      t.string :building_name, null: false
      t.integer :order_id    ,foreign_key: true
      t.timestamps
    end
  end
end
