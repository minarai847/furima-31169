class UserOrder 
  include ActiveModel::Model
  attr_accessor :post_code,:municipalities,:shipping_area_id,:address_number,:phone_number,:building_name,:order_id,:token,:user_id,:item_id,:area_id,:token

  
  
  with_options presence: true do
    validates :municipalities
    validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
    validates :phone_number, format:{ with: /\A0[0-9]+\z/, message: ' is invalid. Include half-width numbers' } 
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :address_number
  end

  def save
    order=Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code,address_number: address_number, municipalities: municipalities ,shipping_area_id: shipping_area_id , building_name: building_name,phone_number: phone_number,order_id: order.id)
  end

end
