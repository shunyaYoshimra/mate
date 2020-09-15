require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

   it "is valid with profile" do
    user = @user
    post = user.posts.create(
      content: "test-content",
    )
    expect(post).to be_valid
   end

   it "is invalid without content" do
     post = Post.new(content: nil)
     post.valid?
     expect(post.errors[:content]).to include("を入力してください")
   end

   it "is invalid with too long content" do
     post = Post.new(content: "a"*256)
     post.valid?
     expect(post.errors[:content]).to include("は255文字以内で入力してください")
   end

   it "is invalid without user_id" do
    post = Post.new(user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("を入力してください")
  end

end
