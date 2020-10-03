class PartnersController < ApplicationController
  def index
    @user = current_user
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def show
    @user = current_user
    @partners = Partner.all
    @partner = Partner.find(params[:id])
    @dances = @partner.dance_id
    @dance = Dance.where(id: @dances)
    @style = @dance.each do |style|
      puts style
    end
    @move = @style[0]
    @dancers = Dance.select(:title)
  end

  def create
    # @dance = Dance.find(params[:id])
    @partner = Partner.new(partner_params)
    @dances = @partner.dance_id
    # @partners = @dance.partners
    if @partner.save
      redirect_to partner_path(@partner)
      # @dance << @partner.dance
    else
      render :new
    end
  end

  private

  def partner_params
    params.permit(:pseudo, :gender, :age, :location, :dance, :experience, :contact, :email, :password, :dance_id)
  end
end
