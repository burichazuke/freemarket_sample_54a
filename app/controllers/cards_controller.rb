class CardsController < ApplicationController

  require "payjp"

  def new
    @card = Card.new
  end

  def card
    card = Card.find_by(user_id: current_user.id)
    if card
      Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id) 
    end
  end

  def create
    Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
    customer = Payjp::Customer.create
    card = customer.cards.create(card: params[:payjp_token])
    @card = Card.create(user_id: current_user.id, customer_id: customer.id, card_id: card.id)
    
    # credit_cardの登録はsign_upのcredit_cardとmypageのnewの両方のアクションから呼ばれるため、条件分岐で行き先を指定
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:action] == "credit_card"
      redirect_to :finish_user_registration
    else
      redirect_to :mypage_card
    end
  end

  def destroy
    @card = Card.find_by(user_id: current_user.id)   
    Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    @card.destroy
    redirect_to :card_mypage_index
  end
end