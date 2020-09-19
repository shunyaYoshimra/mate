require 'rails_helper'

RSpec.describe "Events", type: :request do

  before do
    user = FactoryBot.create(:user)
    sign_in user
    user.build_profile(
      profile: 'test-profile'
    )
    @event = user.events.create(
      content: "test-content",
      title: 'test-title',
      address: 'test-address',
      date: "2020-09-15 15:00:00",
      user_id: user.id
    )
    @params = FactoryBot.attributes_for(:event)
  end

  describe "GET /index" do
    it "returns http success" do
      get events_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get event_path(@event)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_event_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post events_path, params: { event: @params }
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_event_path(@event)
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /update" do
    it "returns http success" do
      put event_path(@event), params: { event: @params }
      expect(response).to have_http_status(204)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      delete event_path(@event)
      expect(response).to have_http_status(204)
    end
  end
end
