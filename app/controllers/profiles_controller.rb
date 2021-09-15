class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
  end

  def new
    @profile = current_user.build_profile
    @dance = Dance.new
    # @user = current_user
    @dances = Dance.all
    @dances.user = @user
    if dance.save
      redirect_to profile_path
    else
      render 'dances/show'
    end
    @profile = Profile.new
    redirect_to profile_path(@profile)
  end

  def create
    # @user = current_user
    # @dance = Dance.new
    # @user.save
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    # respond_with(@profile)
    redirect_to profile_path(@profile)
  end

  def show
    # @profile = Profile.find_by(user_id: params[:id])
    #   redirect_to profile_path(@profile)
    @profile = current_user
    # @profile_avatar = @profile.avatar
    #ajout de danse dans le profil
    @dances = Dance.all
    @my_dances = []
    @profile.dances.each do |profile_dance|
      @dance = profile_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
      end
    # barre de recherche des danses
    if params[:query].present?
    @dance_search = Dance.where("title LIKE ?", "%" + params[:query] + "%")
    else
    @dances = Dance.all
    end
    # liste de toutes les danses
    @my_selected_dances = @dances.select(params[:id])
    @my_profile_dances = []
    @my_favorite_dances = @dances.each do |my_favorite_dance|
      @my_profile_dances << my_favorite_dance
    end

    # geolocalisation des evenements
    @appointments = Appointment.all
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
    # geolocalisatin des utilisateurs
    @users = User.all
    @dancers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end
    @dancer = @users.each do |dancer|
      dancer.first_name
    end
    # @dances = Dance.select('dances.*')
    # Select et s'ajoute dans la show du profil
  end

  def edit
    @profile = current_user
    @dances = Dance.select('dances.*')
    # Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    @user_dances = @dances.select(params[:id])
  end

  def update
    @profile = Profile.find_by(user_id: params[:id])
    @profile.update(profile_params)
      redirect_to profile_path(@profile)
  end

  def destroy
    @profile = current_user
    @profile.destroy
      respond_with(@profile)
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: params[:id])
  end

  def profile_params
    # params.require(:user).permit(:user_id, :dance_id, :photo, :gender, :age, :location, :experience, :contact, :email, :id)
    params.require(:profile).permit(:avatar, :user_id, :dance_id)
  end
end
