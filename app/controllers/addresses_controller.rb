class AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
  end

  def edit
  end

  def update
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :municipalities, :address, :building).merge(user_id: current_user.id)
  end 

  def set_address
    @address = Address.find(params[:id])
  end

end
