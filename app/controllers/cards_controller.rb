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
      redirect_to card_mypage_index_path
    else
      redirect_to new_card_path
    end
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