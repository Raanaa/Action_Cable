class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
    @chat_room = ChatRoom.new
  end
  def show
    @chat_rooms = ChatRoom.all
    @messages = Message.all
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end
  def new
    @chat_room = ChatRoom.new
    @message = Message.new
  end
  def create
    chat_room = current_user.chat_rooms.build(chat_room_params)
    if chat_room.title != ""
       chat_room.save
       ActionCable.server.broadcast 'room_channel',
        title:  chat_room.title,
        email: chat_room.user.email,
        chat_room_url: chat_room_path(chat_room)
    end
  end
  private
  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
