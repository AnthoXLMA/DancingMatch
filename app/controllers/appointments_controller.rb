class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new
    @appointment.user = current_user
    @partner = Partner.find(params[:partner_id])
    @appointment.partner = @partner
    redirect_to partner_path(@partner, appointed: true) if @appointment.save
  end
end
