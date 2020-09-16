class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms    
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    room = Room.create
    Entry.create(user_id: current_user.id, room_id: room.id)
    Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to room
  end
end
