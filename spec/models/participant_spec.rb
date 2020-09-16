require 'rails_helper'

RSpec.describe Participant, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @event = @user.events.create(
      title: 'test-title',
      content: 'test-conten',
      address: 'test-address',
      date: "2020-09-15 15:00:00",
    )
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of event" do
    event = @event
    expect(event).to be_valid
  end

   it "is valid with user, event" do
    user = @user
    event = @event
    participant = user.participants.create
    participant.event_id = event.id
    expect(participant).to be_valid
   end

   it "is invalid without user_id" do
    participant = Participant.new(user_id: nil)
    participant.valid?
     expect(participant.errors[:user_id]).to include("を入力してください")
   end

   it "is invalid without event_id" do
    participant = Participant.new(event_id: nil)
    participant.valid?
    expect(participant.errors[:event_id]).to include("を入力してください")
  end
end
