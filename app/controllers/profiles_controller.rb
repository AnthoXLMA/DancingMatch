class ProfilesController < ApplicationController
  def edit
    flash[:alert] = "dédé"
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit()
  end
end
