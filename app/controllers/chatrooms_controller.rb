class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find_by(name: "general")
    @message = Message.new
    @messages = Message.all
    @chatrooms = Chatroom.all # NOTE(Eschults): for side navigation
  end

  def new
    @chatroom = Chatroom.new
  end
end
