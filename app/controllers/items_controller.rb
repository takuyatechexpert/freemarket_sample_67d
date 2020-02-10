class ItemsController < ApplicationController
   
  def index
    @items = Item.all
  end


  def new
    @item = Item.new
    @item.images.new

    @category = Category.all.order("id ASC").limit(9)
  end

  def category_children
    @category_children = Category.find(params[:productCategory]).children
  end

  # def category_grandchildren
  #   @category_grandchildren = Category.find(params[:productcategory]).children
  # end

  def create
    @user = User.find(current_user.id)
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @item.images.new
      redirect_to new_item_path
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
    params.require(:item).permit(:name, :description, :price, :size, :status_id, :postage_id, :region_id, :shipping_date_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
