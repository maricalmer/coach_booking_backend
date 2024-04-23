require 'rails_helper'

RSpec.describe SlotsController, type: :request do
  describe "GET /coaches/:coach_id/slots" do
    let(:coach) { create(:coach) }
    let!(:slots) do
      create_list(:slot, 3, coach: coach, start_time: 1.hour.from_now, end_time: 2.hours.from_now)
    end

    it "returns all slots for a specific coach as JSON" do
      get coach_slots_path(coach_id: coach.id), headers: { ACCEPT: "application/json" }
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
      expect(json_response.first['title']).to include("Book #{coach.name}")
      expect(json_response.first['start']).to be_present
      expect(json_response.first['end']).to be_present
    end
  end
end
