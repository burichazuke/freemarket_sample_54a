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
    @identification = Identification.new
    # if 
    #   @identification = current_user.identification
    # else
      
    # end
  end

  def create_identification
  end

  private
  # def identification_params
  #   params.require(:identification).permit(:).merge(user_id: current_user.id)
  # end

end
