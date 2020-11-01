require 'rails_helper'

RSpec.describe Item, type: :model do
before do
  @item = FactoryBot.build(:item)
end

describe '商品の投稿' do
  context "商品が保存できる場合"do
  it "全ての項目が入力されている場合保存される"do
  expect(@item).to be_valid
end
  it "販売価格が半角数字であれば登録できる"do
  @item.price= 500
  expect(@item).to be_valid
end
end

 context "商品が保存できない場合"do
   it "imageが空では保存されない"do
   @item.image = nil
   @item.valid?
   expect(@item.errors.full_messages).to include("Image can't be blank")
    end
      it "カテゴリーが１のとき保存されない"do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category  Select")
     end
     it "商品状態が１のとき保存されない"do
     @item.item_condition_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Item condition  Select")
     end
      it "配送料の負担が１の時保存されない"do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges  Select")
      end
      it "発送元の地域が１の時保存されない"do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area  Select")
      end
      it "発送までの日数が１の時保存されない"do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship  Select")
      end
      it "販売価格が３００未満の時保存されない"do
      @item.price =299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999より大きい時保存されない"do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "商品名が空だった場合保存されない"do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空だった場合保存されない"do
      @item.description= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end

    end
  end
end






