class DancesController < ApplicationController
  def index
    @dances = Dance.all
  end

  def new
    @dance = Dance.new
  end

  def create
    @partner = Partner.find(params[:dance])
    @dance = Dance.new(dance_params)
    @dance.title = @partner.dance
    if @dance.save
      redirect_to partner_path(@partner)
    else
      render 'partners/show'
    end
  end

  def show
    # recuperer le ID de la "dance" pour afficher avec le .title dans la show
    @dance = Dance.find(params[:id])
    # attribuer une variable qui recupere l'ID + le title de la danse
    @style = @dance.title
    # recuperer l'ensemble des partenaires de chaque danse
    # @partner = Partner.find(params[:id])
    # @dancer = Partner.where(dance: 'rock')
    # @dancers = @style.dancer
    # @dancers = Partner.select(:pseudo)
  end

  private

  def dance_params
    params.require(:dance).permit(:title)
  end
end
