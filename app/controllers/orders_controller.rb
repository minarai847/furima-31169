class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_index,only:[:index,:create]
  before_action :item_index,only:[:index,:create]
  def index
    @user_orders = UserOrder.new
     @item = Item.find(params[:item_id])
      
     
    
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
def user_index
  @item = Item.find(params[:item_id])
  if @item.user_id == current_user.id
    redirect_to root_path
  end
end
 def item_index
  @item = Item.find(params[:item_id])
  @order = Order.find(params[:item_id])
  if @item.id == @order.item_id
    redirect_to root_path
  
 end 
end
end


