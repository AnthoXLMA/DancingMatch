class ProfilesController < ApplicationController
  def create
    @user = current_user
    @dance = Dance.new
    # @user.dance = @dance
    @dance.save
      redirect_to profile_path
  end

  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def show
    @user = current_user
    @user_dances = Dance.where(id: params[:id])
    # @user = User.find(params[:id])
    @dance = Dance.new
    @dances = @user.dance
  end

  def new
    @dance = Dance.new
    @user = current_user
    @dances = Dance.all
    @dances.user = @user
      redirect_to profile_path
  end

  def edit
    flash[:alert] = "alert"
    @user = current_user
    @dances = Dance.select('dances.*')
    @menu_dances = @user.dances
  end

  def chatroom
    general = Chatroom.find_by(name: "general")
    redirect_to chatroom_path(general) if general
  end

  def update
    @user = current_user
    @my_dances = []
    @dances = Dance.all
    @user_dances = @dances.each_with_index do |dance, index|
      @my_dances << dance
    end
    # @user.update(user_params)
    # redirect_to user_path
    # @user_dances = Dance.find(params[:dance_id])
    # @profile = Dance.new(dance_params)
    # @dance.user = @user
    if @dance.save
      redirect_to profile_path(@profile)
    else
      render 'profiles/show'
    end
  end

  private

  def profile_params
    params.permit(:pseudo, :gender, :age, :location, :experience, :contact, :email, :dance, :id)
  end
end
