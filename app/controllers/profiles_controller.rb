class ProfilesController < ApplicationController
  def show
    @user = current_user
    @dances = Dance.all
    @dance = @dances.each do |dance|
      puts dance
    end
    @user_dance = @user
    # @dance_existing = current_user.dances.where(dance_id: @dance)
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
    @dances = Dance.all
    @menu_dances = @dances.each do |dance|
      dance.title
    end
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.permit(:pseudo, :gender, :age, :location, :experience, :contact, :email, :dance)
  end
end
