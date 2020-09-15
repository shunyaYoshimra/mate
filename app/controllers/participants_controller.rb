class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  def create
    event = Event.find(params[:event_id])
    participant = event.participants.new
    participant.user_id = current_user.id
    participant.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    participant = Participant.find_by(event_id: params[:event_id], user_id: current_user.id)
    participant.destroy
    redirect_back(fallback_location: root_path)
  end
end
