class ProfilesController < ApplicationController
  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def create
    @profile = current_user.create_profile(profile_params)
    @profile.avatar.attach(params[:profile][:avatar])
    @user = current_user
    @dance = Dance.new
    @user.save
      redirect_to profile_path
  end

  def show
    @profile = current_user
    # @profile = current_user.build_profile
    @my_dances = []
    @profile.dances.each do |profile_dance|
      @dance = profile_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
    end
    @appointments = Appointment.all
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
  end

  def new
    @profile = current_user.build_profile
    @dance = Dance.new
    @user = current_user
    @dances = Dance.all
    @dances.user = @user
    if dance.save
    redirect_to profile_path
    else
      render 'dances/show'
    end
  end

  def edit
    @user = current_user
    @dances = Dance.select('dances.*')
    #Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    # @user_dances = @dances.select(params[:id])
      redirect_to edit_profile_path(@dances)
  end

  def update
    @user = current_user
    @user_dances = Dance.select(params[:dance_id])
    @dance = Dance.find_by(id: params[:dance_id])
    @user.save
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :dance_id, :gender, :age, :location,
     :experience, :contact, :email, :id, :photo)
  end
end
