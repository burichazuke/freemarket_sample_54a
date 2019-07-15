class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  # before_action :set_prefecture, only: [:new, :edit]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to :credit_card_user_registration
    else
      render :address_user_registration
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to edit_address_path, notice: "変更しました"
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :prefecture, :municipalities, :address, :building, :phone).merge(user_id: current_user.id)
  end 

  def set_address
    @address = current_user.address
  end

  # def set_prefecture
  #   @prefectures = Prefecture.all
  # end
end
