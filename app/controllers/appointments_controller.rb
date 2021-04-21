class AppointmentsController < ApplicationController
     before_action :set_appointment, only: [:show]

  def index
    @appointments = Appointment.all
  end

  def new
    # @dance = Dance.find(params[:dance_id])
    @appointment = Appointment.new
    @appointment.save
  end

  def create
    @user = current_user
    @appointment = Appointment.new(appointment_params)
    @appointment.user = @user
    @appointment.save
      redirect_to appointments_path(@appointments)
  end

  def show
    @user = current_user
    # @appointments = Appointment.all
    @appointment = Appointment.find(id: params[:id])
    # Select et s'ajoute dans la show du profil
    @user_events = Appointment.where(id: params[:id])
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:dance_id])
  end


  def appointment_params
    params.require(:appointment).permit(:id, :start_on, :end_on, :name, :address, :user_id, :dance_id)
  end
end
