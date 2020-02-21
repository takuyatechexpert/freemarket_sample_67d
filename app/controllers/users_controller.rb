class UsersController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:index, :destroy, :show]

  def create
  end

  def new
  end

  def index
    @item = Item.all.order("RAND()").limit(9).where.not(seller_id: current_user.id).where(buyer_id: nil)
    @user = current_user.nick_name
  end

  def destroy
  end

  def show
    @item = Item.all.order("id DESC").limit(9).where(seller_id: current_user.id).where(buyer_id: nil)
  end

  
  private
  def user_params
    params.require(:user).permit(:nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end
end
