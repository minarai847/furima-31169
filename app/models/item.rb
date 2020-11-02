class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_to_ship
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1, message:" Select" } do
    validates :category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
    validates :price,presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
end
