class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact) }
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:email, :password, :encrypted_password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact)
  end

  def sign_out
    devise_parameter_sanitizer.destroy(:sign_out)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :password, :password_confirmation, :first_name, :location, :last_name, :age, :experience, :contact])
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
