require 'rails_helper'

RSpec.describe "Profiles", type: :request do

  before do
    user = FactoryBot.create(:user)
    sign_in user
    @params = FactoryBot.attributes_for(:profile)
  end

  describe "GET /new" do
    it "returns http success" do
      get new_profile_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post profiles_path, params: { profile: @params }
      expect(response).to have_http_status(302)
    end
  end
end
