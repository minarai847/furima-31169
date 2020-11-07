class OrdersController < ApplicationController
  def index
     @item = Item.find(params[:item_id])
    @user_orders = UserOrder.new
  end
def create
 
  @user_orders = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
  
    if @user_orders.valid?
      pay_item
      @user_orders.save
      return redirect_to root_path
     else
      render :index
    end
  end
  def  done
    @user_order= Item.find(params[:id])
    @user_order.update( order_id: current_user.id)
   end
private

def order_params
  params.require(:user_order).permit(:post_code, :shipping_area_id,:address_number,:building_name, :municipalities, :prefectures, :phone_number).merge( user_id: current_user.id, token: params[:token], item_id: params[:item_id] )
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )    
end
end


