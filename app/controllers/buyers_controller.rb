class BuyersController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:show, :pay]

  def show
    if @card.blank?
      redirect_to action: :new
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => @card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end


  def edit
  end
  
  def update
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end