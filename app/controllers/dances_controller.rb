class DancesController < ApplicationController
  before_action :set_dance, only: [:show, :edit, :update, :destroy]

  def index
    @dances = params[:query].present? ? Dance.where("lower(title) LIKE ?", "%#{params[:query].downcase}%") : Dance.all
  end

  def show
    @appointments_on_map = @dance.appointments.geocoded
    @markers = geo_markers(@appointments_on_map)
    @users_of_this_dance = @dance.users
  end

  def new
    @dance = Dance.new
  end

  def create
    @dance = current_user.dances.build(dance_params)
    if @dance.save
      redirect_to dances_path
    else
      render 'profile/show'
    end
  end

  def update
    @dance.update(dance_params)
    redirect_to dance_path(@dance)
  end

  def destroy
    @dance.destroy
    redirect_to profile_path(current_user)
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dance_params
    params.require(:dance).permit(:title, :photo)
  end

  def geo_markers(objects, image_url = 'mapbox-marker-icon-red.svg')
    objects.map do |appointment|
      { lat: appointment.latitude, lng: appointment.longitude, infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }), image_url: image_url }
    end
  end
end
