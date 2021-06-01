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
    @my_dances = []
    @user.dances.each do |user_dance|
      @dance = user_dance.title
      @my_dances << @dance if !@my_dances.include?(@dance)
    end
    # @my_partners = []
    # @user.partners.each do |user_partner|
    #   @partner = user_partner.name
    #   @my_partners << @partner if !@my_partners.include(@partner)
    # end
  end

  def new
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

  # def chatroom
  #   general = Chatroom.find_by(name: "general")
  #   redirect_to chatroom_path(general) if general
  # end

  def update
    @user = current_user
    @user_dances = Dance.select(params[:dance_id])
    @dance = Dance.find_by(id: params[:dance_id])
    @user.save
  end

  private

  def profile_params
    params.permit( :gender, :age, :location, :experience, :contact, :email, :id)
  end
end
