class DancesController < ApplicationController
before_action :set_dance, only: [:show]

def index
  if params[:query].present?
    # @dances = Dance.where(title: params[:query])
    @dances = Dance.where("title LIKE ?", "%" + params[:query] + "%")
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
  @users = User.all
end

def new
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
  # @my_selected_dances = @dances.select(params[:id])
  # afficher sous une liste index/card, tous les evenements de cette danse
  @appointments = Appointment.all
  @appointments_on_map = @appointments.where(dance_id: params[:id])
  @markers = @appointments_on_map.geocoded.map do |appointment_on_map|
      {
        lat: appointment_on_map.latitude,
        lng: appointment_on_map.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment_on_map: appointment_on_map }),
        image_url: helpers.asset_url('mapbox-marker-icon-red.svg')
      }
    end
  @users = User.all
  @partners = @dance.users
  @users_of_this_dance = @partners.where(id: params[:id])
  @profile_dances = []
  @profile_dances << Dance.find(params[:id])
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
