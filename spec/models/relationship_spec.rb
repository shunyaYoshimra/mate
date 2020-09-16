require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user_a = User.create(
      username: 'userA',
      email: 'a@test.com',
      password: 'passwordA',
    )
    @user_b = User.create(
      username: 'userB',
      email: 'b@test.com',
      password: 'passwordB',
    )
  end

  it "has a valid user_a" do
    user = @user_a
    expect(user).to be_valid
  end

  it "has a valid user_b" do
    user = @user_b
    expect(user).to be_valid
  end

  it "is valid with follower_id, following_id" do
    user_a = @user_a
    user_b = @user_b
    relationship = Relationship.create(
      following_id: user_a.id,
      follower_id: user_b.id
    )
    expect(relationship).to be_valid
  end

  it "is invalid without following_id" do
    relationship = Relationship.new(following_id: nil)
    relationship.valid?
    expect(relationship.errors[:following_id]).to include("を入力してください")
   end

   it "is invalid without follower_id" do
    relationship = Relationship.new(follower_id: nil)
    relationship.valid?
    expect(relationship.errors[:follower_id]).to include("を入力してください")
   end
end
