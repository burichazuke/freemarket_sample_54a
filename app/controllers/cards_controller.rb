class CardsController < ApplicationController

  require "payjp"

  def new
    render layout: "single"
  end

  def create
    Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
    customer = Payjp::Customer.create
    card = customer.cards.create(card: params[:payjp_token])
    @card = Card.create(user_id: current_user.id, customer_id: customer.id, card_id: card.id)
    if @card.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end
  end
end