class ItemsController < ApplicationController
   
  def index
  
  end

  def new
    @item = Item.new
    @item.images.new
  end
  
  def create
    # binding.pry
    # @user = User.find(current_user.id)
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
  end

  def show
  
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :size, :item_status, :delivery_charge, :delivery_area, :shipment, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end
