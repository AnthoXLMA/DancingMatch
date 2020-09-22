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
    @dance = Dance.find(dance_params[:id])
    # attribuer une variable qui recupere l'ID + le title de la danse
    @style = @dance.title
    # @partner_dance = Partner.find(partner_params[:id])
    # recuperer l'ensemble des partenaires de chaque danse
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
