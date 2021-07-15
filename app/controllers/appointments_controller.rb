class AppointmentsController < ApplicationController
    before_action :set_appointment, only: [:show]

  def index
    @appointments = Appointment.all
    # @appointments  = @appointments.near(appointment.address, 10) if appointment.address.present?
    @markers = @appointments.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment }),
        image_url: helpers.asset_url('mapbox-marker-icon-blue.svg')
      }
    end
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
    @appointment = Appointment.find(params[:id])
    # Select et s'ajoute dans la show du profil
    @user_events = Appointment.where(id: params[:id])
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end


  def appointment_params
    params.require(:appointment).permit(:id, :start_on, :end_on, :name, :address, :user_id, :dance_id)
  end
end
