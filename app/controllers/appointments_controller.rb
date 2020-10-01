class AppointmentsController < ApplicationController
  # def create
  #   @appointment = Appointment.new
  #   @appointment.user = current_user
  #   @dance = Dance.find(params[:dance_id])
  #   @appointment.user = @user
  #   redirect_to user_path(@user, appointment: true) if @appointment.save
  # end

  def index
    @appointments = Appointment.all
  end

  def new
    @dance = Dance.find(params[:dance_id])
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment = Appointment.find(params[:dance_id])
    @appointment.dance = @dance

    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:user_id, :partner_id, :status, :date, :location)
  end
end
