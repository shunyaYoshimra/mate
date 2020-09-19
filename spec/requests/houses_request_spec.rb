require 'rails_helper'

RSpec.describe "Houses", type: :request do

  before do
    user = FactoryBot.create(:user)
    sign_in user
    user.build_profile(
      profile: 'test-profile'
    )
    @house = House.create(
      name: "test-house",
      profile: 'test-profile',
      prefecture: 'test-prefecture',
    )
    @params = FactoryBot.attributes_for(:house)
  end

  describe "GET /index" do
    it "returns http success" do
      get houses_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get house_path(@house)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_house_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post houses_path, params: { house: @params }
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT /update" do
    it "returns http success" do
      put house_path(@house), params: { house: @params }
      expect(response).to have_http_status(302)
    end
  end
  
end
