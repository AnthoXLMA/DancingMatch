class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @profile = Profile.find(params[:profile_id])
    @request.profile = @profile
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  # def accept
  #   @request = Request.find(params[:id])
  #   @request.status = 'accepted'
  #   @request.save
  #   redirect_to profile_requests_path
  # end

  # def refuse
  #   @request = Request.find(params[:id])
  #   @request.status = 'refused'
  #   @request.save
  #   redirect_to profile_requests_path
  # end

  private

  def request_params
    params.require(:request).permit(:profile_id, :dance_id)
  end
end
