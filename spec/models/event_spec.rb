require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

   it "is valid with content, title, address, date" do
    user = @user
    event = user.events.create(
      content: "test-content",
      title: 'test-title',
      address: 'test-address',
      date: "2020-09-15 15:00:00",
    )
    expect(event).to be_valid
   end

   it "is invalid without content" do
     event = Event.new(content: nil)
     event.valid?
     expect(event.errors[:content]).to include("を入力してください")
   end

   it "is invalid with too long content" do
     event = Event.new(content: "a"*256)
     event.valid?
     expect(event.errors[:content]).to include("は255文字以内で入力してください")
   end

   it "is invalid without title" do
    event = Event.new(title: nil)
    event.valid?
    expect(event.errors[:title]).to include("を入力してください")
  end

  it "is invalid with too long title" do
    event = Event.new(title: "a"*51)
    event.valid?
    expect(event.errors[:title]).to include("は50文字以内で入力してください")
  end

  it "is invalid without address" do
    event = Event.new(address: nil)
    event.valid?
    expect(event.errors[:address]).to include("を入力してください")
  end

  it "is invalid without date" do
    event = Event.new(date: nil)
    event.valid?
    expect(event.errors[:date]).to include("を入力してください")
  end

  it "is invalid without user_id" do
    event = Event.new(user_id: nil)
    event.valid?
    expect(event.errors[:user_id]).to include("を入力してください")
  end
end
