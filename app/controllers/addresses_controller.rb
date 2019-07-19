class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to :credit_card_user_registration
    else
      render "devise/registrations/address"
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
end
