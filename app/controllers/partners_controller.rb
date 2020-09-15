class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    @partner = Partner.new
    @partners = @dance.partners
  end

end
