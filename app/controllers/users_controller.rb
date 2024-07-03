class UsersController < ApplicationController
  before_action :set_user, only: [:index, :create, :new, :show, :edit, :update, :destroy, :sign_out]
  # layout false
  def index
    @users = User.all
    @user = current_user
    @profiles = Profile.all
    @dances = Dance.all
    if params[:query].present? || params[:gender_query].present? || params[:name_query].present?
      @users  = User.where("location ILIKE ?", "%#{params[:query]}%")
                    .where("gender ILIKE ?", "%#{params[:gender_query]}%")
                    .where("first_name ILIKE ?", "%#{params[:name_query]}%")
    else
      @users =  User.all
    end

    @subscriptions = Subscription.where(user_id: :id)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end
    @mapmarkers = @markers.to_json
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
    @appointments = Appointment.all
    @profiles = Profile.all
    @requests = Request.where(user_id: :id)
    @dancing_partners = Request.where(profile: @user.profiles)
    @dances = Dance.all
    # @profile = @user.profiles.each do |profile|
    #   profile
    # end

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end

    if params[:query].present?
    @dances = Dance.where("lower(title) LIKE ?", "%#{params[:query].downcase}%")
    else
      @dances = Dance.all
    end
    @appointments_selected = @appointments.map do | my_appointment |
        my_appointment.name
    end
    @review = Review.new
    @request = Request.where(user_id: :id)
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

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:gender, :first_name, :last_name, :age,
      :location, :experience, :contact, :email, :encrypted_password, :password,
      :photo, :city, :level, :xp, :coaching_status, :practice_a_week, :technique, :ambition, :empathie, :social)
  end
end
