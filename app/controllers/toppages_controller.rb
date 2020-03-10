class ToppagesController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:index]
  
  def index
    @items = Item.includes(:images).order("id DESC").first(6)
    # includesでitemモデルの子モデル(imageモデル)を取得できる
    # 一対多なので「images」複数形になっている
  end

end
