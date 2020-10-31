class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message:" Select" } 
  validates :item_condition_id, numericality: { other_than: 1, message:" Select"}
  validates :shipping_charges_id, numericality: { other_than: 1, message:" Select" }
  validates :shipping_area_id, numericality: { other_than: 1, message:" Select" }
  validates :days_to_ship_id, numericality: { other_than: 1, message:" Select" }
  
  validates :price,presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  

  belongs_to :user
  has_one    :order
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :days_to_ship

end
