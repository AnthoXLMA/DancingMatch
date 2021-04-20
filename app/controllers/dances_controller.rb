class DancesController < ApplicationController
   before_action :set_dance, only: [:show]

  def index
    if params[:query].present?
      @dances = Dance.where(title: params[:query])
    else
      @dances = Dance.all
    end

    @dance = @dances.each do |dance|
      puts dance
    end

    @style = @dance.find(params[:id])
    @dancer = @style.each do |yd|
      puts yd
    end
  end

  def new
    @dance = Dance.new
    @dance.save
  end

  def create
    @user = current_user
    # @user = User.find(user_params[:dance_id])
    @dance = Dance.new(dance_params)
    # @dance.profile = @profile
    if @dance.save
      redirect_to dances_path(@dance)
    else
      render 'profile'
    end
  end

  def show
    @user = current_user
    @dances = Dance.all
    # @dance = Dance.find(dance_params)
    @dance = Dance.find(params[:id])
      @style = @dance.title
    #Select et s'ajoute dans la show du profil
      @user_dances = Dance.where(id: params[:id])
  end

  def update
    @dance = Dance.find(params[:id])
    @dance.update(dance_params)
    redirect_to dance_path
  end

  def destroy
    @dance = Dance.find(params[:id])
    @user = @dance.user
    @dance.destroy
    redirect_to profile_path(@user)
  end

  private

  def set_dance
    @dance = Dance.find(params[:id])
  end

  def dance_params
    params.require(:dance).permit(:id, :title)
  end
end
