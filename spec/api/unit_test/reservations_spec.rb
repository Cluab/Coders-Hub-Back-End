require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  include Rails.application.routes.url_helpers
  let(:item) { FactoryBot.create(:item) }
  let(:user) { FactoryBot.create(:user) }
  let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') }
  let(:access_token) do
    Doorkeeper::AccessToken.create(resource_owner_id: user.id, application_id: application.id).token
  end

  before do
    post api_v1_user_reserve_path, params: {
      reservation: { item_id: item.id, date: '2023-04-11', city: 'New York' }
    }, headers: {
      Authorization: "Bearer #{access_token}"
    }
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new reservation' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'returns an error message' do
        post api_v1_user_reserve_path, params: {
          item_id: item.id,
          reservation: { date: Date.today, city: 'New York' }
        }, headers: {
          Authorization: "Bearer #{access_token}"
        }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
