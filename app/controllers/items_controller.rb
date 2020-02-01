class ItemsController < ApplicationController
   
  def index
  
  end

  def new
    
  end
  
  def create
    # binding.pry
    # @user = User.find(current_user.id)
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  
  end
  
  private
  def item_params
    params.permit(:name, :price, :size, :item_status, :delivery_charge, :delivery_area, :shipment).merge(seller_id: current_user.id)
  end

end
