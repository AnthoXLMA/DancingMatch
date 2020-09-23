class AppointmentsController < ApplicationController
  def create
    @appointment = Appointment.new
    @appointment.user = current_user
    @dance = Dance.find(params[:dance_id])
    @appointment.dance = @dance
    redirect_to dance_path(@dance, appointment: true) if @appointment.save
  end
end
