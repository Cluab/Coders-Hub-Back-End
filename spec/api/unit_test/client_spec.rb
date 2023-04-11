require 'rails_helper'

RSpec.describe Api::V1::ClientController, type: :request do
  describe 'GET /client.json' do
    context 'when React client does not exist' do
      before { get '/api/v1/client/react' }

      it 'returns status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        json_response = JSON.parse(response.body)

        expect(json_response['error']).to eq('no React Client Present')
      end
    end
  end
end
