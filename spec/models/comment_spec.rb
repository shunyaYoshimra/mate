require 'rails_helper'

RSpec.describe Comment, type: :model do
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

   it "is valid with user, post, comment" do
    user = @user
    post = @post
    comment = user.comments.create(
      content: 'test-content'
    )
    comment.post_id = post.id
    expect(comment).to be_valid
   end

   it "is invalid without user_id" do
     comment = Comment.new(user_id: nil)
     comment.valid?
     expect(comment.errors[:user_id]).to include("を入力してください")
   end

   it "is invalid without post_id" do
    comment = Comment.new(post_id: nil)
    comment.valid?
    expect(comment.errors[:post_id]).to include("を入力してください")
  end

end
