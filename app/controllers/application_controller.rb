class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :set_session, only: [:show, :edit, :update, :destroy]
  helper_method :current_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact, :gender, :photo) }
  end

  # def sign_up_params
  #   devise_parameter_sanitizer.sanitize(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact, :gender, :photo)
  # end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact, :gender, :photo)
  # end

  # def configure_sign_out_params
  #   devise_parameter_sanitizer.permit(:authenticity_token)
  # end

  # def destroy
  #   # @user = current_user
  #   # # @user_update = User.find(params[:id])
  #   # # User.find_by([:user_id]).destroy
  #   # if @user_update.present?
  #   #   @user_update.destroy
  #   # end
  #   #   redirect_to root_path
  # end

  # def sign_out
  #   @user = current_user
  #   # User.find(session[:user_id]).destroy
  #   # @user.destroy
  #     # redirect_to root_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact, :gender, :photo])
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
