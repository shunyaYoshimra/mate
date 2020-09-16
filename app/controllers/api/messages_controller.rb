class Api::MessagesController < ApplicationController
  def index
    room = Room.find(params[:id])
    @messages = room.messages.all
    render :index, formats: :json, handlers: :jbuilder
  end

  def show
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.room_id = params[:id]
    if @message.save
      render :show, formats: :json, handlers: :jbuilder
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
