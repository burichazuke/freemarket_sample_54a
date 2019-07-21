# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout 'single'
  prepend_before_action :check_captcha, only: [:validation]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def register
  end

  # GET /resource/sign_up/registration
  def new
    @step_num = 0
    super
  end

  # POST /resource/sign_up/sms_confirmation
  def validation
    @user = User.new(user_params)
    if @user.valid?
      @step_num = 1
      session[:user_attributes] = user_params
      redirect_to :sms_confirmation_user_registration
    else
      @step_num = 0
      render :new
    end
  end

  # GET /resource/sign_up/sms_confirmation
  def sms_confirmation
    @step_num = 1
    @user = User.new
  end

  # post phone
  def add_phone_number
    @step_num = 1
    session[:user_attributes] = session[:user_attributes].merge(phone_number: phone_number_params[:phone_number])
    @user = User.new(session[:user_attributes])
    if @user.valid_and_set_verification_code
      session[:user_attributes] =  session[:user_attributes].merge(verification_code: @user.verification_code)
      redirect_to :verification_code_input
    else
      render :sms_confirmation
    end
  end

  # GET /resource/sign_up/sms_confirmation/sms
  def verification_code_input
    @step_num = 1
    @user = User.new
  end

  
  def verification
    @step_num = 1
    session[:user_attributes] = session[:user_attributes].merge(verification_code_confirmation: verification_params[:verification_code_confirmation])
    @user = User.new(session[:user_attributes])
    if @user.verify_and_save(session[:user_attributes])
      sign_in @user
      redirect_to :address_user_registration
    else
      render :verification_code_input
    end
  end

  # GET /resource/sign_up/address
  def address
    @step_num = 2
    @address = Address.new
  end

  # GET /resource/sign_up/credit_card
  def credit_card
    @step_num = 3
    @card = Card.new
  end

  # GET /resource/sign_up/finish
  def finish
    @step_num = 4
  end

  # POST /resource
  # def create
  #   super
  # end

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
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   address_user_registration
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new user_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end 
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
  end

  def phone_number_params
    params.require(:user).permit(:phone_number)
  end

  def verification_params
    params.require(:user).permit(:verification_code_confirmation)
  end
end
