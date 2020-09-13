require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

   it "is valid with profile" do
    user = @user
    profile = user.build_profile(
      profile: "test-profile",
    )
    expect(profile).to be_valid
   end

   it "is invalid without profile" do
     profile = Profile.new(profile: nil)
     profile.valid?
     expect(profile.errors[:profile]).to include("を入力してください")
   end

   it "is invalid with too long profile" do
     profile = Profile.new(profile: "a"*256)
     profile.valid?
     expect(profile.errors[:profile]).to include("は255文字以内で入力してください")
   end

   it "is invalid without user_id" do
    profile = Profile.new(user_id: nil)
    profile.valid?
    expect(profile.errors[:user_id]).to include("を入力してください")
   end
end

