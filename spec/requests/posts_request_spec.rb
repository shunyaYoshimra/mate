require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    user = FactoryBot.create(:user)
    sign_in user
    @post = user.posts.create(
      content: 'test-content'
    )
    @params = FactoryBot.attributes_for(:post)
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post posts_path, params: { post: @params }
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete post_path(@post)
      expect(response).to have_http_status(204)
    end
  end
end
