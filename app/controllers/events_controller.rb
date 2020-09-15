class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.order(created_at: :desc)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      participant = @event.participants.new
      participant.user_id = current_user.id
      participant.save
      redirect_to event_url(@event), notice: 'イベントを企画しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :address, :latitude, :longitude, :date, :paid, :price)
  end
end
