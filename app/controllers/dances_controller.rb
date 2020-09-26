class DancesController < ApplicationController
  def index
    @dances = Dance.all
    @dance = Dance.select('title')
    @dancers = Partner.where(params[:id])
    @dancer = @dancers.each do |yd|
      puts yd
    end
  end

  def new
    @dance = Dance.new
  end

  def show
    @user = current_user
    @dances = Dance.all
    @dance = Dance.new(dance_params {:title})
    @dance = Dance.find(params[:id])
    @style = @dance.title
    @dancers = Partner.where(params[:id])
    @dancer = @dancers.each do |yd|
      puts yd
    end
    @list = @dancer.map(&:pseudo)
  end

  def create
    @user = current_user
    @dance = Dance.new(dance_params {:title})
    @dance.user = @user
    if @dance.save
      redirect_to profile_path(@dances)
    else
      render 'dances/show'
    end
  end

  def update
    @dance = Dance.find(params[:id])
    @dance.update(dance_params)
    redirect_to dance_path
  end

  private

  def dance_params
    params.require(:dance).permit(:title, :id, :user_id)
  end
end
