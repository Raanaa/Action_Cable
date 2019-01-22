class RoomMessageChannel < ApplicationCable::Channel
  def subscribed
   @chat_room = ChatRoom.find_by(id: params[:id])
   stream_from "room_message_#{@chat_room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
