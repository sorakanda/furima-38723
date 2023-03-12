class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :item_find_id

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end



  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy' 
      )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if ( current_user.id == @item.user_id ) || @item.order.present?
      redirect_to root_path
    end
  end

  def item_find_id
    @item = Item.find(params[:item_id])
  end

end
