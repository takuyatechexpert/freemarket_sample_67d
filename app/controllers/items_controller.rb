class ItemsController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:new,:create, :show]
  before_action :set_item, only: [:show ,:edit, :destroy]
  

  def index
    @items = Item.all
  end


  def new
    if user_signed_in?
      @item = Item.new
      @item.images.new
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      redirect_to new_item_path
    end
  end

  def show
    @user = User.all
  end

  def edit
    if user_signed_in? && @item.seller_id == current_user.id
      @parents = Category.where(ancestry:nil)
      # 編集する商品を選択
      @item = Item.find(params[:id])
      # 登録されている商品の孫カテゴリーのレコードを取得
      @selected_grandchild_category = @item.category
      # 孫カテゴリー選択肢用の配列作成
      @category_grandchildren_array = [{id: "---", name: "---"}]
      Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
        grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
        @category_grandchildren_array << grandchildren_hash
      end
      # 選択されている子カテゴリーのレコードを取得
      @selected_child_category = @selected_grandchild_category.parent
      # 子カテゴリー選択肢用の配列作成
      @category_children_array = [{id: "---", name: "---"}]
      Category.find("#{@selected_child_category.id}").siblings.each do |child|
        children_hash = {id: "#{child.id}", name: "#{child.name}"}
        @category_children_array << children_hash
      end
      # 選択されている親カテゴリーのレコードを取得
      @selected_parent_category = @selected_child_category.parent
      # 親カテゴリー選択肢用の配列作成
      @category_parents_array = [{id: "---", name: "---"}]
      Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
        parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
        @category_parents_array << parent_hash
      end
    else
      redirect_to root_path 
    end
  end

  def update
    @item = Item.find(params[:id])
    if user_signed_in? && @item.seller_id == current_user.id
      if @item.update(item_params)
        redirect_to item_path
      else
        redirect_to edit_item_path
      end
    else
      redirect_to root_path 
    end
  end

  def destroy
      if@item.destroy
        redirect_to root_path
      else
        redirect_to item_path
      end
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :status_id, :postage_id, :region_id, :shipping_date_id, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
