class DancesController < ApplicationController
  before_action :set_dance, only: [:show, :new, :edit, :update, :destroy]
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
    @dance = Dance.new
    @dances = @user.dances

    @dance = Dance.find(params[:id])
    @style = @dance.title
    @dancers = Partner.where(dance_id: dance_params[:id]).select("pseudo")
    @dancer = @dancers.each do |yd|
      puts yd
    end
    @list = @dancer.map(&:pseudo)
  end

  def create
    @user = current_user
    @dance = Dance.new(dance_params)
    @dance_user = @dance.user_id
    @dance.save
  end

  def update
    @dance = Dance.new
    redirect_to profile_path
  end

  private

  def dance_params
    params.permit(:id)
  end

  def set_dance
    @dance = Dance.find(params[:id])
  end
end
