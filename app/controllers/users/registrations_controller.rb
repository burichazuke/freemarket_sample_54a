# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'single'
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # 後々、wicked用のクラスを作成してそこに基本メソッド以外のメソッドは移行する予定
  # GET /resource/sign_up
  def register
    # redirect_to :sms_confirmation_user_registration
  end

  # GET /resource/sign_up/sms_confirmation
  def sms_confirmation
    @user = ""
    # redirect_to :address_user_registration
  end

  # GET /resource/sign_up/address
  def address
    @user = ""
    # redirect_to :credit_card_user_registration
  end

  # GET /resource/sign_up/credit_card
  def credit_card
    @user = ""
    # redirect_to :finish_user_registration
  end

  # GET /resource/sign_up/finish
  def finish
    @user = ""
    # redirect_to :root
  end

  # GET /resource/sign_up/registration
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # super(resource)
    sms_confirmation_user_registration_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
