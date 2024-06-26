class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @request.save
  end

  def create
    @request = Request.new(new_request_params)
    @request.user = current_user
    @profile = Profile.find(params[:user_id])
    @request.profile = @profile
    if @request.save
      redirect_to requests_path
    else
      render 'users/show'
    end
  end

  def show
    @request = Request.find(params[:profile_id])
    @user = User.find(params[:user_id])
  end

  def accept
    @request = Request.find(params[:id])
    @request.status = 'accepted'
    @request.save
      redirect_to profile_requests_path
  end

  def refuse
    @request = Request.find(params[:id])
    @request.status = 'refused'
    @request.save
      redirect_to profile_requests_path
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def new_request_params
    params.permit(:profile_id, :user_id)
  end

  def request_params
    params.require(:request).permit(:profile_id, :user_id)
  end
end
