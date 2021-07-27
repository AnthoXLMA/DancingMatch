class DancesController < ApplicationController
   # before_action :set_dance, only: [:show]

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
    @dance = Dance.new(dance_params)
    # @dance.user = @user
    if @dance.save
      redirect_to dances_path(@dance)
    else
      render 'profile/show'
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
    # @dance_partners = []
    # @dance.partners.each do |dance_partner|
    #   @partner_of_style = dance_partner.count
    #   @dance_partners << @partner_of_style if !@my_partners.include(@partner_of_style)
  # end
end

  def update
    @dance = Dance.find(params[:id])
    @dance.user = user.dance
      redirect_to profile_path
  end

  def destroy
    @dance = Dance.find(params[:id])
    @user = @dance.user
    @dance.destroy
    redirect_to profile_path(@user)
  end

  private

  # def set_dance
  #   @dance = Dance.find(params[:id])
  # end

  def dance_params
    params.require(:dance).permit(:id, :title)
  end
end
