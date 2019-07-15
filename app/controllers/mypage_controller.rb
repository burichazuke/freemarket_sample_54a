class MypageController < ApplicationController
  
  def index
  end

  def profile
  end

  def identification  
    @address = current_user.address
  end

  def card  
  end

  def logout  
  end

end
