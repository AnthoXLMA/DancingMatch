class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def show
    @partner = Partner.find(params[:id])
    @dance = Dance.new
    @dances = @partner.dances
  end

  def create
    @dance = Dance.find(params[:dance_id])
    @partner = Partner.new(partner_params)
    @partner.dance = @dance
    if @partner.save
      redirect_to partner_path(@partner)
    else
      render :new
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:pseudo, :gender, :age, :location, :dance, :experience, :contact, :email, :password, :dance_id)
  end
end
