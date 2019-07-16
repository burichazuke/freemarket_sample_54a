class CardsController < ApplicationController

  require "payjp"

  def new
    render layout: "single"
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
    customer = Payjp::Customer.create
    card = customer.cards.create(card: params[:payjp_token])
    @card = Card.create(user_id: current_user.id, customer_id: customer.id, card_id: card.id)
    redirect_to card_mypage_index_path
  end

  def destroy
    @card = Card.find_by(user_id: current_user.id)   
    Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.destroy
    redirect_to card_mypage_index_path
  end
end