require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = @user.posts.create(
      content: 'test-conten'
    )
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of post" do
    post = @post
    expect(post).to be_valid
  end

   it "is valid with user, post" do
    user = @user
    post = @post
    like = user.likes.create
    like.post_id = post.id
    expect(like).to be_valid
   end

   it "is invalid without user_id" do
     like = Like.new(user_id: nil)
     like.valid?
     expect(like.errors[:user_id]).to include("を入力してください")
   end

   it "is invalid without post_id" do
    like = Like.new(post_id: nil)
    like.valid?
    expect(like.errors[:post_id]).to include("を入力してください")
  end
end
