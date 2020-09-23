class ProfilesController < ApplicationController
  def show
    @user = current_user
    @dances = Dance.all
    @dance = Dance.new
    @dance.save
    # redirect_to profile_path
  end

  def new
    @dance = Dance.new
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
  end

  def create
    @user = current_user
    @dances = Dance.all
    @dance = Dance.find(dance_params)
    if @dance.save
      redirect_to dance_path(@dance)
    else
      render :new
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
