class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :sign_out]
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
    # @user = User.new(params[:user])
    # if @user.save
    #   session[:user_id] = @user.id
    #   flash[:notice] = "Thank you for signing up! You are now logged in."
    #   redirect_to new_profile_path
    # else
    #   render :action => 'new'
    # end
    @user = User.find(params[:user_id])
    @profile = @user.profile.build(params[:profile])
    if @profile.save
    flash[:notice] = 'Profile was successfully created.'
    redirect_to(@profile)
    # redirect_to new_user_profile_path(:user_id => @user)
    else
    flash[:notice] = 'Error.  Something went wrong.'
    render :action => "new"
    end
    @dance = Dance.new()
    @dance.user = @user
    @user.save
  end

  def show
    @user = User.find(params[:id])
    # @profile = current_user
    # @my_dances = []
    # @profile.dances.each do |profile_dance|
    # @dance = profile_dance.title
    # @my_dances << @dance if !@my_dances.include?(@dance)
    # end
    # @users_of_this_dance = @users.where(dance_id: params[:id])
    # @partners = @users_of_this_dance.each do |partner|
    #   partner.first_name
    # end
  end

  def edit

  end

  def update
    @user = User.find(params[:id])
    @dances = Dance.all
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
  end

  def user_params
    params.require(:user).permit(:gender, :dances, :first_name, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :photo)
  end
end
