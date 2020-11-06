class OrdersController < ApplicationController
  def index
     @item = Item.find(params[:item_id])
    @user_orders = UserOrder.new
  end
def create

  
  @user_orders = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_orders.valid?
      
      @user_orders.save
      return redirect_to root_path
    else
      render :index
    end
  end
end
private

def order_params
  params.require(:user_order).permit(:post_code, :shipping_area_id,:address_number,:building_name, :municipalities, :prefectures, :phone_number).merge( user_id: current_user.id, token: params[:token], item_id: params[:item_id] )
  
end


