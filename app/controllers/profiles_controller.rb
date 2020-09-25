class ProfilesController < ApplicationController
  def show
    @user = current_user
    @dances = Dance.all
    @dance= Dance.new
    @user_partners = Partner.includes(dance: @user.dance)
    @appointments = @user.appointments
  end

  def new
    @dance = Dance.new
    @dance.save
    redirect_to user_path(@dance)
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
    @dances = Dance.select('dances.*')
    @menu_dances = @user.dances
  end

  def create
    @user = current_user
    @dances = Dance.all
    @dance = Dance.new(dance_params)
    @dance_name = Dance.find(dance_params[:dance])
    @dance.save
      redirect_to profile_path(@dances)
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
