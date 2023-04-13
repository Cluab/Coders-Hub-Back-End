require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') }
  let(:access_token) do
    Doorkeeper::AccessToken.create(resource_owner_id: user.id, application_id: application.id).token
  end

  describe 'GET #me' do
    context 'when user is authenticated' do
      before do
        get api_v1_users_me_path, headers: {
          Authorization: "Bearer #{access_token}"
        }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it "returns the current user's information" do
        expect(response.body).to include(user.username)
        expect(response.body).to include(user.email)
        expect(response.body).to include(user.role)
      end
    end

    context 'when user is not authenticated' do
      before do
        get api_v1_users_me_path
      end

      it 'returns http unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
