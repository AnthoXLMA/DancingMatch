# frozen_string_literal: true

class SCOPE::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create, :destroy]

  def create
    super do |resource|
      BackgroundWorker.trigger(resource)
    end
  end

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    # @user = User.find_by_username(params[:session][:username])
    # if @user && @user.authenticate(params[:session][:password])
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # else
    #   redirect_to '/login'
    # end
  end

  # DELETE /resource/sign_out
  def destroy
    super
    # User.find(session[:user_id]).destroy
    # session[:user_id] = nil
      session.delete(:user_id)
    redirect_to root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def configure_sign_out_params
    devise_parameter_sanitizer.permit(:sign_out, keys: [:attribute])
  end

end
