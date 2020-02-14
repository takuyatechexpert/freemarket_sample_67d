class BuyersController < ApplicationController

  require 'payjp'
  before_action :set_card, only: [:show, :pay]
  before_action :set_item, only: [:show, :pay]

  def show
    if @card.blank?
      redirect_to controller: "card", action: :new
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Item.update(buyer_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => @card.customer_id,
      :currency => 'jpy',
    )
    
    redirect_to root_path #tトップページに遷移
  end

  def edit
  end
  
  def update
  end

  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end