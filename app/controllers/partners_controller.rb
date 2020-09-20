class PartnersController < ApplicationController
  def index
    return redirect_to edit_profile_path unless current_user.all_skills_rated?
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def show
    @partner = Partner.find(params[:id])
    @dance = @partner.dance.title
    @styles = @dances
    @dancers = Dance.select(:title)
  end

  def create
    @dance = Dance.find(params[:id])
    @partner = Partner.new(partner_params)
    @partner.dance = @dance
    @partners = @dance.partners
    if @partner.save
      redirect_to partner_path(@partner)
      @dance.title << @partner.dance
    else
      render :new
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:pseudo, :gender, :age, :location, :dance, :experience, :contact, :email, :password, :dance_id)
  end
end
