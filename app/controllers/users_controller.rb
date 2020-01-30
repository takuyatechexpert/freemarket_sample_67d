class UsersController < ApplicationController


  def create
  end

  def new
  end

  def index
  end
  
  private
  def user_params
    params.require(:user).permit(:nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday)
  end
end
