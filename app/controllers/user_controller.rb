class UserController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def new
    @user = User.new(user_params)
    @user.save
  end

  def create
    # @user = current_user
    @user = User.new(user_params)
    @user.save
    #   redirect_to users_path(@users)
    # else
    #   render 'home'
    # end
    # @dance = Dance.new
    # session[:user_id] = user.id
    #   redirect_to registration_path
    # @user.save
    #   redirect_to profile_path
  end

  def show
    @profile = current_user
    @my_dances = []
    @profile.dances.each do |profile_dance|
      @dance = profile_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
    end
  end

  # def new
  #   @dance = Dance.new
  #   @user = current_user
  #   @dances = Dance.all
  #   @dances.user = @user
  #   if dance.save
  #   redirect_to profile_path
  #   else
  #     render 'dances/show'
  #   end
  # end

  # def edit
  #   @user = current_user
  #   @dances = Dance.select('dances.*')
  #   #Select et s'ajoute dans la show du profil
  #   @my_dances = @dances.select(params[:id])
  #   # @user_dances = @dances.select(params[:id])
  # end

  # def edit
  #   @user = current_user
  #   @dances = Dance.select('dances.*')
  #   #Select et s'ajoute dans la show du profil
  #   @my_dances = @dances.select(params[:id])
  #   # @user_dances = @dances.select(params[:id])
  #   @user.save
  #     # redirect_to edit_profile_path(@dances)
  # end

  # def update
  #   @user = current_user
  #   @user_dances = Dance.select(params[:dance_id])
  #   @dance = Dance.find_by(id: params[:dance_id])
  #   @user.save
  # end

    def edit
    @profile = current_user
    # @dances = Dance.select('dances.*')
    #Select et s'ajoute dans la show du profil
    @my_dances = @dances.select(params[:id])
    @user_dances = @dances.select(params[:id])
    # redirect_to edit_profile_path(@dances)
  end

  def update
    @user = current_user
    # @user_dances = Dance.select(params[:dance_id])
    # @dance = Dance.find_by(id: params[:dance_id])
    @user.update(user_params)
      redirect_to profile_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:gender, :dances, :age, :location, :experience, :contact, :email, :encrypted_password, :password, :id, :photo)
  end
end
