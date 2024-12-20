class SubscriptionsController < ApplicationController
  def new
    @user         = current_user
    @appointment  = Appointment.find(params[:appointment_id])
    @subscription = Subscription.new
    @subscription.save
  end

  def create
    @appointment  = Appointment.find_by(id: params[:appointment_id])
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    flash.alert = "Vous êtes inscrit!"
    if @subscription.save
      redirect_to user_path(current_user.id)
    end
  end

private
  def set_appointment
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.permit(:user_id, :appointment_id)
  end
end
