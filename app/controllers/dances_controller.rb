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
    @partner_dance = Partner.find(params[:id])
    # recuperer l'ensemble des partenaires de chaque danse
    # @dancer = Partner.where(dance: 'rock')
    @dancer = Partner.where(dance_id: '24').select("pseudo").ids
    # @dancers = Partner.select(:pseudo)
    @dancers = @dancer
    # @dancers = @dance.partners
    # @dances = Dance.all
    # @styles = @partner.dances

    # @dancers_ids = @dancers
    # @dancers_names = @dancers_ids
  end

  private

  def dance_params
    params.require(:dance).permit(:title)
  end
end
