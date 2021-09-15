class MeetingsController < ApplicationController
  def create
    @user_id = @view.ask_for_user_id
    @partner_id = @view.ask_for_partner_id
    @meeting = Meeting.new
    @meeting.user = @user.find(user_id)
    @meeting.partner = @partner.find(partner_id)
    @meeting.save(meeting)
  end
end
