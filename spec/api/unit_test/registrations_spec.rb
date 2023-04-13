require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController, type: :controller do
  let(:client_app) { FactoryBot.create(:application) }
  let(:valid_attributes) { FactoryBot.attributes_for(:user, client_id: client_app.uid) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:user, username: nil) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect do
          post :create, params: valid_attributes
        end.to change(User, :count).by(1)
      end

      it 'returns a successful response' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(User, :count)
      end

      it 'returns an error response' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid client_id' do
      let(:invalid_client_attributes) { valid_attributes.merge(client_id: 'invalid_client_id') }

      it 'returns an unauthorized response' do
        post :create, params: invalid_client_attributes
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
