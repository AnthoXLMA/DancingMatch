class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :new, :show, :create, :edit, :update, :destroy]

  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @profiles = Profile.all
    @profiles = current_user.profiles
    @review = Review.new
  end

  def new
    @user = User.find(params[:user_id])
    @profile = @user.profile.build
    @profile.save
      redirect_to profile_path(@profile.id)
  end

  def create
    @user = current_user
    @profiles = Profile.all
    # @profile2 = Profile.new(profile:{ user_id: current_user.id, avatar: '', dance_id: id, niveau: '', investissement: ''})
    @profile = Profile.new(new_profile_params)
    # @profile = @user.profile.build
    if !@profiles.include? @profile
    @profile.user_id = current_user.id
      @profile.save
      redirect_to edit_profile_path(@profile)
    else
      redirect_to dances_path
    end
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
    @profile = Profile.find_by(id: params[:id])
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
    @requests = Request.where(profile_id: @profile)
    @reviews = Review.all
    @profiles = Profile.all
      # CREATION DU MATCHING TEST COMPARE
    # @user_profile_skills = Profile::SKILLS.map { |skill| @user[skill] }
    # @profile_skills = Profile::SKILLS.map { |skill| @profile[skill] }
    # @already_compared = current_user.meetings.where(profile_id: @profile).exists?
    # @profile = Profile.select('profile.*', "#{@profile.matching_percentage_calc} AS matching_percentage")
    #               .where(id: params[:id])
 end

  def edit
    @profile = Profile.find(params[:id])
    @profiles = Profile.all
    @profile_user = @profiles.each do |profile|
      puts profile.dance.title
    end
      # @profile = User.find(params[:id])
    @dances = Dance.all
      # Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    @user_dances = @dances.select(params[:id])
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
    params.permit(:user_id, :avatar, :dance_id, :niveau, :investissement, :training_per_week)
  end

  def profile_params
    # params.permit(:gender, :dances, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :id, :photo)
    params.require(:profile).permit(:user_id, :avatar, :dance_id, :niveau, :investissement, :training_per_week)
  end
end
