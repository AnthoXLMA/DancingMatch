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

    @partners = Partner.all
    @dancers = Partner.where(dance_id: @dance)
    @partner = @partners.each do |partner|
      puts partner
    end

    @counters = Partner.where(dance_id: :id)
  end

  def new
    @dance = Dance.new
    @dance.save
    redirect_to profile_path(@user)
  end

  def show
    @user = current_user
    @dances = Dance.all
    # @dance = Dance.find(dance_params)
    @style = @dance.title
    @user.dances = []
    @user.dances = Dance.where(id: params[:id]) # => select et s'ajoute dans la show du profil
    @partners = Partner.all
    @dancers = Partner.where(dance_id: @dance)
    @dancer = @dancers.each do |dancer|
      puts dancer
    end
    @list = @dancer.map(&:pseudo)
  end

  def create
    @user = current_user
    @dance = Dance.new(dance_params)
    @user.dance = Dance.all
    if @dance.save
      redirect_to dances_path(@dance)
    else
      render 'profile'
    end
  end

  # def create
  #   @playground = Playground.find(params[:playground_id])
  #   @event = Event.new(event_params)
  #   @event.playground = @playground
  #   if @event.save
  #     redirect_to playground_path(@playground)
  #   else
  #     render 'playgrounds/show'
  #   end
  # end

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
