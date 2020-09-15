require 'rails_helper'

RSpec.describe "Api::Comments", type: :request do
  before do
    user = FactoryBot.create(:user)
    sign_in user
    @post = user.posts.create(
      content: 'test-content'
    )
    @params = FactoryBot.attributes_for(:comment)
  end

  describe "GET /new" do
    it "returns http success" do
      post = @post
      get api_comments_path, params: {id: post.id }
      expect(response).to have_http_status(200)
    end
  end

  #クエリパラメータが渡せない。。
  #describe "POST /create" do
  #  it "returns http success" do
  #   post api_comments_path, params: { comment: @params }
  #   expect(response).to have_http_status(302)
  #  end
  # end

end
