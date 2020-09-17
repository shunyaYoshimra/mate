require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @room = Room.create!
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of room" do
    room = @room
    expect(room).to be_valid
  end

   it "is valid with user, room" do
    user = @user
    room = @room
    entry = user.entries.create
    entry.room_id = room.id
    expect(entry).to be_valid
   end

   it "is invalid without user_id" do
    entry = Entry.new(user_id: nil)
    entry.valid?
    expect(entry.errors[:user_id]).to include("を入力してください")
  end

  it "is invalid without room_id" do
    entry = Entry.new(room_id: nil)
    entry.valid?
    expect(entry.errors[:room_id]).to include("を入力してください")
  end

end
