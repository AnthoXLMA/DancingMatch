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
    @dance = Dance.find(params[:dance_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.dance = @appointment
    if @appointment.save
      redirect_to appointments_path(@appointment)
    else
      render 'dance/show'
    end
  end

  def show
    @user = current_user
    @appointments = Appointment.all
    # @appointment = Appointment.where(id: params[:id])
    # Select et s'ajoute dans la show du profil
    # @user_events = Appointment.where(id: params[:id])
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end


  def appointment_params
    params.require(:appointment).permit(:id, :start_on, :end_on, :name, :address, :user_id, :dance_id)
  end
end
