class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
    @item.images.new
    @category = Category.all.order("id ASC").limit(13)
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

 
  def create
    @user = User.find(current_user.id)
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @category = Category.all.order("id ASC").limit(13)
      @item.images.new
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
    @user = User.find_by(id: @item.user_id)
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :status_id, :postage_id, :region_id, :shipping_date_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end


end
