class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :move_to_index,only: [:edit,:update,:destroy]
  
  def index
   
     @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end

  def edit
   
  end
  def update
    
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
  end
end
def destroy
    @item.destroy
    
      redirect_to root_path
  end


  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:item_condition_id,:shipping_charge_id,:shipping_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end
  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

    
end
