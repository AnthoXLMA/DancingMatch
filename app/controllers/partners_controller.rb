class PartnersController < ApplicationController
  def index
    @partners = Partner.all

    # @user   = current_user
    # @partners  = @partners.near(current_user.location, 10) if current_user.location.present?
    # @partners  = @partners.where(name: current_user.name) if current_user.activity.present?

    # @markers = @partners.map do |dance|
    #   {
    #     lat: partner.latitude,
    #     lng: partner.longitude,
    #     infoWindow: render_to_string(partial: "info_window", locals: { partner: partner }),
    #     image_url: helpers.asset_url('marker.svg')
    #   }
    # end
  end

  def show
    @partner = Partner.find(params[:id])
    @partners = @dance.partner
  end
end
