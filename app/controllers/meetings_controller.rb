class MeetingsController < ApplicationController
  def create
    @user_id = @view.ask_for_user_id
    @profile_id = @view.ask_for_profile_id
    @meeting = Meeting.new(meeting_params)
    @meeting.user = @user.find(user_id)
    @meeting.profile = @partner.find(profile_id)
    @meeting.save(meeting)
  end
  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:datetime, :user_id, :profile_id, :dance_id)
  end
end
