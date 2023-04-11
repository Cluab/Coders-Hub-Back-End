require 'rails_helper'

RSpec.describe Api::V1::ClintController, type: :request do
  describe 'GET /clint.json' do
    context 'when React client does not exist' do
      before { get '/api/v1/clint/react' }

      it 'returns status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        json_response = JSON.parse(response.body)

        expect(json_response['error']).to eq('no React Clint Present')
      end
    end
  end
end
