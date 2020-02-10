class ItemsController < ApplicationController
   
  def index
    @items = Item.all
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
    
    @item = Item.find(params[:id])
    
  end 

  def edit 

    @item = Item.find(params[:id])
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params) 
       redirect_to item_path
    else
       render action: :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :item_status, :delivery_charge, :delivery_area, :shipment, images_attributes: [:id, :image]).merge(seller_id: current_user.id)
  end

end
