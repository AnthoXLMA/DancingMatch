class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name) }
  # end
  # def sign_up_params
  #   devise_parameter_sanitizer.sanitize(:first_name)
  # end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:first_name)
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gender, :pseudo, :location, :email, :password, :experience, :contact])
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
