class ItemsController < ApplicationController
  def index
    
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      render 'devise/sessions/new'
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  #def destroy
  #  redirect_to root_path
  #end


  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

end