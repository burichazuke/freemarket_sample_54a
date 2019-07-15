class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
  end

  def edit
    @address = ""
  end

  def update
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :postal_code, :prefecture, :municipalities, :address, :building).merge(user_id: current_user.id)
  end 

  def set_address
    @address = Address.find(params[:id])
  end

end
