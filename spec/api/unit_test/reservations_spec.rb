require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') }
  let(:access_token) do
    Doorkeeper::AccessToken.create(resource_owner_id: user.id, application_id: application.id).token
  end

  describe 'GET #index' do
    before do
      @item1 = FactoryBot.create(:item)
      # let(:item) { create(:item) }
      # let(:user1) { create(:user1) }
      @item2 = FactoryBot.create(:item)
      get '/api/v1/user/reservations', headers: {
        Authorization: "Bearer #{access_token}"
      }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns items in JSON format' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    # When the parameters are valid
  end

  describe 'POST #create' do
    context 'with valid params' do
      #  Whether a new reservation has been created,
      xit 'creates a new reservation' do
        expect do
          post :create, params: { item_id: item.id, reservation: { date: Date.tomorrow, city: 'New York' } },
                        session: { user_id: user1.id }
        end.to change(Reservation, :count).by(1)
      end

      # Whether the controller returns a JSON response with the created reservation.
      xit 'returns a JSON response with the new reservation' do
        post :create, params: { item_id: item.id, reservation: { date: Date.tomorrow, city: 'New York' } },
                      session: { user_id: user1.id }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)).to include('id', 'date', 'city', 'item_id', 'user_id', 'created_at',
                                                     'updated_at')
      end
    end

    # when the parameters are invalid

    context 'with invalid params' do
      # The controller should return a JSON response with errors.

      xit 'returns a JSON response with errors' do
        post :create, params: { item_id: item.id, reservation: { date: nil, city: 'New York' } },
                      session: { user_id: user1.id }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)).to include('date')
      end
    end
  end
end
