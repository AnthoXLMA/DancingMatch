class DancesController < ApplicationController
before_action :set_dance, only: [:show]

def index
  if params[:query].present?
    @dances = Dance.where("lower(title) LIKE ?", "%#{params[:query].downcase}%")
  else
    @dances = Dance.all
  end
  @dance = @dances.each do |dance|
    puts dance.title
  end
  @style = @dance.find(params[:id])
  @dancer = @style.each do |yd|
    puts yd
  end
  @my_selected_dances = []
end

def new
  @dance = Dance.new
  @dance.save
end

def create
  @user = current_user
  @dance = Dance.new(dance_params)
  @dance.user = @user
  if @dance.save
    redirect_to dances_path(@dance)
  else
    render 'profile/show'
  end
end

def show
  # @user = current_user
  @dances = Dance.all
  # @dance = Dance.find(params[:id])
  @style = @dance.title
  @profiles = Profile.all
  @partners_of_this_dance = []
  @profiles.where(dance_id: params[:id]).each do |partner|
    @partners_of_this_dance << partner if !@partners_of_this_dance.include? partner
  end
  @my_new_dances = []
    @dances.select do |my_moving|
      @my_new_dances << my_moving if my_moving
    end
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
  @event_managers = @dance.users
  @users_of_this_dance = Profile.where(dance_id: params[:id])
end

  def update
    @dance = Dance.find(params[:id])
    @dance.update(dance_params)
    @dance.save
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
    params.require(:dance).permit(:title, :user_id, :photo)
  end
end
