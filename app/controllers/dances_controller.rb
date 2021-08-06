class DancesController < ApplicationController
before_action :set_dance, only: [:show]

def index
  if params[:query].present?
    @dances = Dance.where(title: params[:query])
  else
    @dances = Dance.all
  end
  @dance = @dances.each do |dance|
    puts dance
  end
  @style = @dance.find(params[:id])
  @dancer = @style.each do |yd|
    puts yd
  end
  @my_select_dances = []
  @dances = Dance.all
  # @events = @appointments.geocoded.map do |appointment|
  #     {
  #       lat: appointment.latitude,
  #       lng: appointment.longitude,
  #       infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
  #       image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
  #     }
  #   end
end

def new
  @dance = Dance.find(params[:dance_id])
  @dance = Dance.new
  @dance.save
end

def create
  @user = current_user
  @dance = Dance.new(dance_params)
  # @dance.user = @user
  if @dance.save
    redirect_to dances_path(@dance)
  else
    render 'profile/show'
  end
end

def show
  @user = current_user
  @dances = Dance.all
  @style = @dance.title
  @my_selected_dances = @dances.select(params[:id])
  # afficher sur la map tous les éléments de cette danse
  # afficher sous une liste index/card, tous les évènements de cette danse
  @appointments = Appointment.where(dance:'id')
  @events = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
end

def update
  @profile = current_user
  @dance = Dance.find(params[:id])
end

  def destroy
    @dance = Dance.find(params[:id])
    @user = @dance.user
    @dance.destroy
    redirect_to profile_path(@user)
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dance_params
    params.require(:dance).permit(:id, :title)
  end
end
