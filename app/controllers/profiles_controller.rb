class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :new, :show, :create, :edit, :update, :destroy]

  def index
    @users    = User.all
    @user     = User.find(params[:user_id])
    @profiles = Profile.all
    @review   = Review.new
  end

  def new
    @profile = Profile.new(new_profile_params)
    # @user     = User.find(params[:user_id])
    @user = current_user
    @profile  = @user.profiles.build
    @profile.save
      # redirect_to dance_profiles_path(@profile.id)
  end

  def create
    @profile = Profile.new(new_profile_params)
    @profile  = current_user.build_profile
    @profile.user     = current_user
    @dance = Dance.find(params[:dance_id])
    @profile.dance = @dance
    @profiles = Profile.all
    if !@profiles.include? @profile
    @profile.user_id = current_user.id
      @profile.save
      redirect_to edit_profile_path(@profile)
    else
      redirect_to dances_path
    end
  end

  def show
    @profiles = Profile.all
    @profile  = Profile.find_by(id: params[:id])
    @user     = current_user
    @profile_avatar = @user.photo
    @dances    = Dance.all
    @dance = Dance.find(params[:id])
    @my_dances = []
    @user.dances.each do |profile_dance|
      @dance  = profile_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
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
    @my_selected_dances = @dances.select(params[:id])
      # SELECTIONNER UNE DANSE ET L'AJOUTER AU PROFIL
    @my_profile_dances = []
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
    @profile      = Profile.find_by(dance_id: params[:dance_id])
    @profiles     = Profile.all
    @profile_user = @profiles.each do |profile|
      puts
      profile.dance.title
    end
      # @profile = User.find(params[:id])
    @dances       = Dance.all
      # Select et s'ajoute dans la show du profil
    @my_dances    = @dances.select(params[:id])
    @user_dances  = @dances.select(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @dances = Dance.all
    @profile.update(profile_params)
      if @profile.update_attributes(profile_params)
        flash[:notice] = 'Profile was successfully updated.'
        redirect_to user_path(@profile.user_id)
      else
        render :action => "edit"
    end
  end

  def destroy
    @user = current_user
    @user.profiles.destroy(@profile)
      redirect_to user_path(@current_user)
  end

private

  def set_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def new_profile_params
    params.permit(:user_id, :dance_id)
  end

  def profile_params
    # params.permit(:gender, :dances, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :id, :photo)
    params.require(:profile).permit(:user_id, :dance_id, :niveau, :avatar, :investissement,
      :training_per_week)
      # :level, :xp, :coaching_status, :practice_a_week,
      # :technique, :ambition, :empathie, :social
  end
end
