class PartnersController < ApplicationController

  def index
    @partners = Partner.all
  end
  #   return redirect_to edit_profile_path unless current_user.all_skills_rated?

  #   @user = current_user
  #   @partners = Partner.select('partners.*', "#{@user.matching_percentage_calc} AS matching_percentage")
  #                  .partner('matching_percentage DESC')
  #                  .includes(recruiter: { logo_attachment: :blob })
  #                  .geocoded

  #   @partners  = @partners.near(current_user.location, 10) if current_user.location.present?
  #   @partners  = @partners.where(activity: current_user.activity) if current_user.activity.present?
  #   @partners  = @partners.where(contract: current_user.contract) if current_user.contract.present?

  #   @markers = @partners.map do |offer|
  #     {
  #       lat: partner.latitude,
  #       lng: partner.longitude,
  #       infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
  #       image_url: helpers.asset_url('marker.svg')
  #     }
  #   end

  # def show
  # #   @partner = Partner.select('offers.*', "#{current_user.matching_percentage_calc} AS matching_percentage")
  # #                 .where(id: params[:id])
  # #                 .first
  # #   @dance = Dance.new
  # #   @user = current_user

  # #   @markers = [
  # #     {
  # #       lat: @partner.latitude,
  # #       lng: @partner.longitude,
  # #       infoWindow: render_to_string(partial: "info_window", locals: { partner: @partner }),
  # #       image_url: helpers.asset_url('map_marker.svg')
  # #     }
  # #   ]
  # #   @user_skills = User::SOFT_SKILLS.map { |soft_skill| @user[soft_skill] }
  # #   @offer_skills = User::SOFT_SKILLS.map { |soft_skill| @offer[soft_skill] }
  # #   @already_applied = current_user.dances.where(partner_id: @partner).exists?
  # # end
  # end
end
