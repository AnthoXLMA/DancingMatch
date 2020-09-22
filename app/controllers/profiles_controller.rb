class ProfilesController < ApplicationController
  def show
    @user = current_user
    @dances = Dance.all
    @dancing_user = @user.dances
  end

  def edit
    # flash[:alert] = "alert"
    @user = current_user
    @dances = Dance.all
    @menu_dances = @dances.each do |dance|
      dance
    end
  end

  def new
    @dance = Dance.new
    @dances = @partner.dance
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
