class DancesController < ApplicationController
  def index
    @dances = Dance.all
    @dance  = @dances.each do |dance|
      puts dance
    end
    @style = @dance.find(params[:id])
    @dancer = @style.each do |yd|
      puts yd
    end
    # @move = Dance.find(params[:id])
    @partners = Partner.all
    @partner = @partners.each do |partner|
      puts partner
    end
    @dancers = Partner.where(dance_id: @dancer)
    # @partner = @partner
  end

  def new
    @dance = Dance.new
  end

  def show
    @user = current_user
    @dances = Dance.all
    # @dance = Dance.new(dance_params {:title})
    @dance = Dance.find(params[:id])
    @style = @dance.title
    # @user.dances = Dance.where(id: params[:id]) # => select et s'ajoute dans la show du profil
    @partners = Partner.all
    @dancers = Partner.where(dance_id: @dance)
    @dancer = @dancers.each do |dancer|
      puts dancer
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
      render :new
    end
  end

  def set_dance
    @dance = Dance.find(params[:id])
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

  def dance_params
    params.require(:dance).permit(:title, :id, :user_id)
  end
end
