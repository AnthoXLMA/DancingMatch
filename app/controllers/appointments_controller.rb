class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :accept, :refuse, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:accept, :refuse, :destroy]

  # GET /appointments
  def index
    @appointments = params[:query].present? ? Appointment.where("address ILIKE ?", "%#{params[:query]}%") : Appointment.all
    @markers = geo_markers(@appointments)
  end

  # GET /appointments/:id
  def show
  end

  # GET /appointments/new
  def new
    @appointment = current_user.appointments.build
  end

  # POST /appointments
  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: "Rendez-vous créé avec succès."
    else
      flash.now[:alert] = "Erreur lors de la création du rendez-vous."
      render :new
    end
  end

  # PATCH /appointments/:id/accept
  def accept
    if @appointment.update(status: 'accepted')
      redirect_to appointments_path, notice: "Rendez-vous accepté."
    else
      redirect_to appointments_path, alert: "Impossible de modifier le rendez-vous."
    end
  end

  # PATCH /appointments/:id/refuse
  def refuse
    if @appointment.update(status: 'refused')
      redirect_to appointments_path, notice: "Rendez-vous refusé."
    else
      redirect_to appointments_path, alert: "Impossible de modifier le rendez-vous."
    end
  end

  # DELETE /appointments/:id
  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Rendez-vous supprimé."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to appointments_path, alert: "Rendez-vous introuvable."
  end

  def appointment_params
    params.require(:appointment).permit(:start_on, :end_on, :name, :address, :dance_id, :pic)
  end

  def geo_markers(objects)
    objects.geocoded.map do |appointment|
      {
        lat: appointment.latitude,
        lng: appointment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { appointment: appointment })
      }
    end
  end

  def authorize_user!
    unless @appointment.user == current_user
      redirect_to appointments_path, alert: "Non autorisé à modifier ce rendez-vous."
    end
  end
end
