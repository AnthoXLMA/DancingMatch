class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @profiles = @user.profiles.includes(:dance)
  end

  def show
    @user = @profile.user
    @appointments = @user.appointments.geocoded
    @dances = @user.dances
    @markers = geo_markers(@appointments)
  end

  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      redirect_to edit_profile_path(@profile)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:dance_id, :avatar, :investissement, :niveau, :training_per_week,
                                    :level, :xp, :coaching_status, :practice_a_week, :technique,
                                    :ambition, :empathie, :social)
  end

  def geo_markers(objects, image_url = 'mapbox-marker-icon-blue.svg')
    objects.geocoded.map do |obj|
      { lat: obj.latitude, lng: obj.longitude, infoWindow: render_to_string(partial: "info_window", locals: { appointment: obj }), image_url: image_url }
    end
  end
end
