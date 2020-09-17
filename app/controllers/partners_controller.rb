class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    @style = @partner.dance
    # @dance = Dance.find(params[:id])
    # @dancer  = Dance.find(dance: params[:id])
    # @style = @partner.dances
  end
end
