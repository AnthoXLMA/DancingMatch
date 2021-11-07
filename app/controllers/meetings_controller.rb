class MeetingsController < ApplicationController
  # before_action :set_meeting, only: [:index, :create, :show, :edit, :update, :sign_out]


  def index
    @meetings = Meeting.all
  end

  # def create
  #   @user_id = @view.ask_for_user_id
  #   @profile_id = @view.ask_for_profile_id
  #   @meeting = Meeting.new
  #   @meeting.user = @user.find(user_id)
  #   @meeting.profile = @partner.find(profile_id)
  #   @meeting.save(meeting)
  # end

  def create
    @meeting = Meeting.new
    @meeting.user = current_user
    @profile = Profile.find(params[:profile_id])
    @meeting.profile = @profile
    if @meeting.save
      redirect_to profile_path(@profile)
    else
      render 'users/show'
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

private
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:datetime, :user_id, :profile_id)
  end
end
