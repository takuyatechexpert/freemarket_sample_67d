class ItemsController < ApplicationController
  before_action :set_item, only: [:show ,:edit, :destroy]

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
      redirect_to item_path(@item)
    else
      @category = Category.all.order("id ASC").limit(13)
      @item.images.new
      render :new
    end
  end

  def show
    ##@profile = User.find_by(user_id: params[:user_id])
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path
    else
       render action: :edit
    end
  end

  def destroy
      if@item.destroy
        redirect_to root_path
      else
        redirect_to item_path
      end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :status_id, :postage_id, :region_id, :shipping_date_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
