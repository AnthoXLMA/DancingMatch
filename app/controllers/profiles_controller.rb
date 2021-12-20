class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:index, :create, :new, :edit, :update, :destroy]

  def index
    @users    = User.all
    @user     = User.find(params[:user_id])
    @profiles = Profile.all
    @review   = Review.new
  end

  def new
    @user         = current_user
    @profiles     = @user.profiles.build
    @profile      = Profile.new(profile_params)
    @profile.user = @user
    @profile.save
    redirect_to profile_path(@profile)
  end

  def create
    @dance    = Dance.find(params[:id])
    # @user   = current_user.id
    @profile  = Profile.new(profile_params)
    # @profile          = current_user.build_profile
    # @profile.user     = @user
    if !@profiles.include? @profile
    # @profile.user_id  = current_user.id
      @profile.save
      redirect_to edit_profile_path(@profile)
    else
      redirect_to dances_path
    end
  end

  def show
    @profiles       = Profile.all
    @profile        = Profile.find_by(id: params[:id])
    @dance          = Dance.find_by(id: params[:id])
    @user           = current_user
    @profile_avatar = @user.photo
    @dances         = Dance.all
    @my_dances      = []
    @user.dances.each do |profile_dance|
      @dance        = profile_dance.title
      @my_dances    << @dance if !@my_dances.include?(@dance)
      end
    if params[:dance]
      @my_dances = @dances.select do |dance|
        dance.title
      end
    end
      # BARRE DE RECHERCHES DES DANSES
    if params[:query].present?
    @dance_search = Dance.where("title LIKE ?", "%" + params[:query] + "%")
      else
    @dances = Dance.all
    end
      # LISTER LES DANSES
    # @my_selected_dances = @dances.select(params[:id])
      # SELECTIONNER UNE DANSE ET L'AJOUTER AU PROFIL
    # @my_profile_dances = []
      # GEOLOCALISATION DES EVENTS
    @appointments = Appointment.all
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
      # GEOLOCALISATION DES USERS
    @users = User.all
    @dancer = @users.each do |dancer|
      dancer.first_name
    end
    @requests = Request.where(profile_id: @profile)
    @reviews = Review.all
  end

  def edit
    @profile      = Profile.find_by(id: params[:id])
    @profiles     = Profile.all
    @profile_user = @profiles.each do |profile|
      puts profile.dance.title
    end
    @dances       = Dance.all
      # Select et s'ajoute dans la show du profil
    @my_dances    = @dances.select(params[:id])
    @user_dances  = @dances.select(params[:id])
  end

  def update
    # @dances = Dance.all
    @profile = Profile.find(params[:id])
    if @profile.update(new_profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    # @user.profile = @user
    @profile.destroy
      redirect_to user_path(current_user)
  end

private

  def set_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def new_profile_params
    params.require(:profile).permit(:user_id, :dance_id, :avatar, :name, :investissement, :niveau, :training_per_week, :level, :xp, :coaching_status, :practice_a_week, :technique, :ambition, :empathie, :social)
  end

  def profile_params
    params.permit(:user_id, :dance_id, :avatar, :investissement, :niveau, :name, :training_per_week, :level, :xp, :coaching_status, :practice_a_week, :technique, :ambition, :empathie, :social)
  end
end
