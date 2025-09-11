class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.find(params[:id])
    @dance = @partner.dance
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to partner_path(@partner)
    else
      render :new
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:pseudo, :gender, :age, :location, :dance, :experience, :contact, :email, :dance_id)
  end
end
