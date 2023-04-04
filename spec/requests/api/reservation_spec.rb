require 'rails_helper'

RSpec.describe "Api::Reservations", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/api/reservation/show"
      expect(response).to have_http_status(:success)
    end
  end

end
