require 'rails_helper'

RSpec.describe Message, type: :model do
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

   it "is valid with user, room, content" do
    user = @user
    room = @room
    message = user.messages.create(
      content: 'test-content'
    )
    message.room_id = room.id
    expect(message).to be_valid
   end

   it "is invalid without user_id" do
    message = Message.new(user_id: nil)
    message.valid?
    expect(message.errors[:user_id]).to include("を入力してください")
  end

  it "is invalid without room_id" do
    message = Message.new(room_id: nil)
    message.valid?
    expect(message.errors[:room_id]).to include("を入力してください")
  end

  it "is invalid without content" do
    message = Message.new(content: nil)
    message.valid?
    expect(message.errors[:content]).to include("を入力してください")
  end

  it "is invalid with too long content" do
    message = Message.new(content: "a"*256)
    message.valid?
    expect(message.errors[:content]).to include("は255文字以内で入力してください")
  end
end
