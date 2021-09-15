class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :sign_out]
  # layout false

  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end
  end

  def new
    @user = User.new
    @user.save
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def show
    @profile = current_user
    @my_dances = []
    @profile.dances.each do |profile_dance|
    @dance = profile_dance.title
    @my_dances << @dance if !@my_dances.include?(@dance)
    end
    @users_of_this_dance = @users.where(dance_id: params[:id])
    @partners = @users_of_this_dance.each do |partner|
      partner.first_name
    end
  end

  def edit
    @profile = current_user
    @dances = Dance.select('dances.*')
    #Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    @user_dances = @dances.select(params[:id])
    # redirect_to edit_profile_path(@dances)
  end

  def update
    @user = current_user
    @user_dances = Dance.select(params[:dance_id])
    @dance = Dance.find_by(id: params[:dance_id])
    @user.update(user_params)
      redirect_to profile_path
  end

  def destroy
    log_out
    redirect_to '/login'
  end

  private

  def set_user
    @user = User.find(params[:id])
    # @users = User.all
  end

  def user_params
    params.require(:user).permit(:gender, :dances, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :id, :photo)
  end
end
