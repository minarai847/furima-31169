require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_orders = FactoryBot.build(:user_order)
end

describe '商品の購入' do
  context "商品が購入できる場合"do
     it"建物名以外入力されている場合"do
     expect(@user_orders).to be_valid
     end
     it "郵便番号に-があれば保存される"do
     @user_order = 000-0000
     expect(@user_orders).to be_valid
    end

    it"tokenが半角英数字であれば保存される" do
      @user_order = 00000000000000000
     expect(@user_orders).to be_valid
    end

  end
end
context"商品が購入できない場合"do

it "tokenが空では登録できないこと" do
  @user_orders.token = nil
  @user_orders.valid?
  expect(@user_orders.errors.full_messages).to include("Token can't be blank")
end


it "郵便番号が空では保存されない"do
  @user_orders.post_code = nil
  @user_orders.valid?
  expect(@user_orders.errors.full_messages).to include("Post code can't be blank")
end
it "都道府県が１では保存されない"do
 @user_orders.shipping_area_id = 1
 @user_orders.valid?
 expect(@user_orders.errors.full_messages).to include("Shipping area Select")
end
it "市町村が空では保存されない"do
@user_orders.municipalities = nil
@user_orders.valid?
expect(@user_orders.errors.full_messages).to include("Municipalities can't be blank")
end
it "番地が空では保存されない"do
@user_orders.address_number = nil
@user_orders.valid?
expect(@user_orders.errors.full_messages).to include("Address number can't be blank")
end
it "電話番号が空では保存されない"do
@user_orders.phone_number = nil
@user_orders.valid?
expect(@user_orders.errors.full_messages).to include("Phone number can't be blank")
end
it"電話番号が11桁以上なら保存されない"do
@user_orders.phone_number = 000000000000
@user_orders.valid?
expect(@user_orders.errors.full_messages).to include("Phone number  is invalid. Include half-width numbers")
end
end
end