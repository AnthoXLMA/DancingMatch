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
    @partner = Partner.find(params[:id])
    # @dancer = Partner.where(dance: 'rock')
    @dancer = Partner.where(dance: params[:id])
    # @dancers = Partner.select(:pseudo)
    @partners = Partner.all
    @dancers = @partners.where(id: 'dance_id')
  end

  private

  def dance_params
    params.require(:dance).permit(:title)
  end
end
