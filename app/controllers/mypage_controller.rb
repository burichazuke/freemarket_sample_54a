class MypageController < ApplicationController

  before_action :user_signed_in?

  def index
  end


  def profile
    @user = current_user
  end

  def update_profile
    @user = User.new(image:"mypage_icon.png", size: "60x60")
    if current_user.update(user_profile_params)
      redirect_to  profile_mypage_index_path, notice: "変更しました"
    else
      render :profile
    end
  end

  def show_detail
  end

  def card
    card = Card.find_by(user_id: current_user.id)
    if card
      Payjp.api_key = ENV["PAYJP_TEST_SECRET"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id) 
    end
  end

  def logout  
  end

  def identification
    @identification = Identification.find_or_initialize_by(user_id: current_user.id)
  end

  def create_identification
    @identification = Identification.find_or_initialize_by(user_id: current_user.id)
    if @identification.update(identification_params)
      redirect_to identification_mypage_index_path, notice: "変更しました"
    else
      render "mypage/identification"
    end
  end

  private
  def identification_params
    params.require(:identification).permit(:postal_code, :prefecture, :municipalities, :address, :building).merge(user_id: current_user.id)
  end

  def user_profile_params
    params.require(:user).permit(:nickname, :introduce, :image)
  end

end
