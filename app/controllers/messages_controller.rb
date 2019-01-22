class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    message = current_user.messages.build(message_params)
    @my_chat_room_id = message.chat_room_id
    if message.body != ""
      message.save
      ActionCable.server.broadcast "room_message_#{@my_chat_room_id}",{
        body:  message.body,
        user_name: current_user.name,
        date: message.timestamp,
        chat_room_id: message.chat_room_id
      }
    end
  end
  private
  def message_params
    params.require(:message).permit(:body , :chat_room_id)
  end
end
