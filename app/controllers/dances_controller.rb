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
    @dance.partner = @partner
    if @dance.save
      redirect_to partner_path(@partner)
    else
      render 'partners/show'
    end
  end

  def show
    @dance = Dance.find(params[:id])
    @partners = Partner.where(dance: params[:id])
  end

  private

  def dance_params
    params.require(:dance).permit(:title)
  end
end
