class MypageController < ApplicationController
  def index
    @user = current_user
  end

  def notification
    @user = current_user
  end

  def todo
    @user = current_user
  end

  def purchase
    @user = current_user
  end

  def purchased
    @user = current_user
  end

  def news
    @user = current_user
  end

  def support
    @user = current_user
  end

  def sales
    @user = current_user
  end

  def point
    @user = current_user
  end

  def update_profile
    if current_user.update(user_profile_params)
      redirect_to  profile_mypage_index_path, notice: "変更しました"
    else
      render :index
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
