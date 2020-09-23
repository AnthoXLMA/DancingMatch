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
  end

  def create
    @dance = Dance.find(dance_params[:id])
    if @dance.save
      redirect_to profile_path
    else
      render 'users/show'
    end
  end

  def show
    @dance = Dance.find(dance_params[:id])
    @style = @dance.title
    @dancers = Partner.where(dance_id: dance_params[:id]).select("pseudo")
    @dancer = @dancers.each do |yd|
      puts yd
    end
    @list = @dancer.map(&:pseudo)
  end

  private

  def dance_params
    params.permit(:id)
  end
end
