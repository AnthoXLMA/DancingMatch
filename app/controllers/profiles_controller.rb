class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:pseudo, :gender, :age, :location, :experience, :contact, :email)
  end
end
