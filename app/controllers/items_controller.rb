class ItemsController < ApplicationController
   
  def index
  
  end

  def new
    @item = Item.new
    @item.images.new
    # @prefecture = Prefecture.all
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
    params.require(:item).permit(:name, :description, :price, :size, :status_id, :postage_id, :region_id, :shipping_date_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
