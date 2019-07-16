class MypageController < ApplicationController

  def index
  end

  def profile
  end

  def card
  end

  def logout  
  end

  def identification
    if 
      @identification = current_user.identification
    else
      @identification = Identification.new
    end
  end

  def create_identification
    create
    update
  end

  private
  # def identification_params
  #   params.require(:identification).permit(:).merge(user_id: current_user.id)
  # end

end
