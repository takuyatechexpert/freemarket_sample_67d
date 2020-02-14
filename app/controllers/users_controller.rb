class UsersController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:index, :show]

  def create
  end

  def new
  end

  def index
    @item = Item.all.order("RAND()").limit(9)
    @user = current_user.nick_name
  end

  def destroy
  end

  def show
  end

  
  private
  def user_params
    params.require(:user).permit(:nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end
end
