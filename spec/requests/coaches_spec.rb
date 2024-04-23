require 'rails_helper'

RSpec.describe "Coaches", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get coaches_path, headers: { ACCEPT: "application/json" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "returns all coaches as JSON" do
      FactoryBot.create(:coach, name: "John Doe", timezone: "UTC+0")
      FactoryBot.create(:coach, name: "Jane Doe", timezone: "UTC-5")

      get coaches_path, headers: { ACCEPT: "application/json" }
      json_response = JSON.parse(response.body)

      expect(json_response.count).to eq(2)
      expect(json_response.first['name']).to eq("John Doe")
    end
  end
end
