class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :sign_out]
  # layout false

  def index
    @users = User.all
    @profiles = Profile.all
    @dances = Dance.all
  end

  def new
    @user = User.new
    @user.save
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.profile.build(params[:profile])
    if @profile.save
    flash[:notice] = 'Profile was successfully created.'
    redirect_to(@profile)
    else
    flash[:notice] = 'Error.  Something went wrong.'
    render :action => "new"
    end
    @dance = Dance.new()
    @dance.user = @user
    @user.save
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @dances = Dance.all
    @profile = current_user
    @my_dances = []
    @profile.dances.each do |profile_dance|
    @dance = profile_dance.title
    @my_dances << @dance if !@my_dances.include?(@dance)
    end
    @markers = @users.geocoded.map do |u|
      {
        lat: u.latitude,
        lng: u.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { u: u }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
    if params[:query].present?
    @dances = Dance.where("lower(title) LIKE ?", "%#{params[:query].downcase}%")
    else
      @dances = Dance.all
    end
    @review = Review.new
    # @reviews = @user.reviews
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @dances = Dance.all
      if @user.update(user_params)
        flash[:notice] = 'User was successfully updated.'
        redirect_to user_path
      else
        render :action => "edit"
    end
  end

  def destroy
    log_out
    redirect_to '/login'
  end

  def destroy_profile
    @user = current_user
    @user.profiles.destroy(@profile)
      redirect_to user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :photo)
  end
end
