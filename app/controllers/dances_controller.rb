class DancesController < ApplicationController
  def index
    @dances = Dance.all
    @dancers = Partner.where(dance_id: dance_params[:id])
    @dancer = @dancers.each do |yd|
      puts yd
    end
  end

  def new
    @dance = Dance.new
    @dance.save
  end

  def show
    @user = current_user
    @dance = Dance.new(dance_params)
    @dance = Dance.find(params[:id])
    @style = @dance.title
    @dancers = Partner.where(dance_id: dance_params[:id]).select("pseudo")
    @dancer = @dancers.each do |yd|
      puts yd
    end
    @list = @dancer.map(&:pseudo)
  end

  def create
  #   @user = current_user
  #   @dance = Dance.find(params[:id])
  #   @dance_user = @dance.user_id
  #   @dance = Dance.new
  #   @dances = @user.dances
  #   # @dance.save
    @user = current_user
    @dance = Dance.new(dance_params)
    @dance.user = @user
    if @dance.save
      redirect_to profile_path
    else
      render 'dances/show'
    end
  end

  def update
    @dance = Dance.find(params[:id])
    @dance.update(dance_params)
    redirect_to profile_path
  end

  private

  def dance_params
    params.permit(:id, :title)
  end
end
