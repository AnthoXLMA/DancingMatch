class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :create, :edit, :update, :destroy]

  def index
    @users = User.all
    @profiles = Profile.all
    @dances << dance.push
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
    @user = User.find(params[:user_id])
    @profile = @user.profile.build
    @profile.save
      redirect_to profile_path(@profile)
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @user.save
    @profile.save
      redirect_to profile_path(@profile)
    # @user = User.find(params[:user_id])
    # @profile = @user.profile.build(params[:profile])
    # if @profile.save
    # flash[:notice] = 'Profile was successfully created.'
    # redirect_to(@profile)
    # else
    # flash[:notice] = 'Error.  Something went wrong.'
    # render :action => "new"
    # end
  end

  def show
    @profile = Profile.find_by(user_id: params[:id])
    # @profile = Profile.find(params[:id])
    #   redirect_to profile_path(@profile)
    @user = current_user
    @profile_avatar = @user.photo
    @dances = Dance.all
    # TABLEAU des danses de l'utilisateur "has_many :dances, through appointments" //
    @my_dances = []
    @user.dances.each do |profile_dance|
      @dance = profile_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
      end
    if params[:dance]
      @my_dances = @dances.select do |dance|
        dance.title
      end
    end
    # BARRE DES RECHERCHES DES DANSES
    if params[:query].present?
    @dance_search = Dance.where("title LIKE ?", "%" + params[:query] + "%")
    else
    @dances = Dance.all
    end
    # LISTER LES DANSES // inutile
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
  end

  def edit
    @profile = current_user
    # @profile = User.find(params[:id])
    @dances = Dance.all
    # Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    @user_dances = @dances.select(params[:id])
  end

  def update
    @profile = current_user
    @dances = Dance.all
    @profile.update(profile_params)
      if @profile.update_attributes(profile_params)
        flash[:notice] = 'Profile was successfully updated.'
        redirect_to profile_path
      else
        render :action => "edit"
      end
  end

  def destroy
    @profile = Profile.find_by(user_id: params[:id])
    @profile.destroy
      redirect_to(profiles_url)
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: params[:id])
  end

  def profile_params
    # params.permit(:gender, :dances, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :id, :photo)
    params.permit(:user_id, :avatar, :dance_id)
  end
end
