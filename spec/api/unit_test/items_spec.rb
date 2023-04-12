require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:application) { Doorkeeper::Application.create!(name: 'MyApp', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob') }
  let(:access_token) do
    Doorkeeper::AccessToken.create(resource_owner_id: user.id, application_id: application.id).token
  end

  describe 'GET #index' do
    before do
      @item1 = FactoryBot.create(:item)
      @item2 = FactoryBot.create(:item)
      get '/api/v1/items', headers: {
        Authorization: "Bearer #{access_token}"
      }
    end

    it 'returns a success response' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all items' do
      expect(assigns(:items)).to match_array([@item1, @item2])
    end

    it 'returns items in JSON format' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          name: 'Mancoba',
          photo: 'https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4',
          description: 'This is the last class item',
          price: 20,
          mentor_name: 'Front-End Mentor',
          duration: '2 hours'
        }
      end

      it 'creates a new Item' do
        expect do
          post '/api/v1/items', params: { item: valid_attributes }, headers: {
            Authorization: "Bearer #{access_token}"
          }
        end.to change(Item, :count).by(1)
      end

      it 'renders a JSON response with the new item' do
        post '/api/v1/items', params: { item: valid_attributes }, headers: {
          Authorization: "Bearer #{access_token}"
        }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.content_type).to match(%r{^application/json})
        expect(response.body).to include(valid_attributes[:name])
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) do
        {
          name: '',
          description: '',
          price: '',
          duration: ''
        }
      end

      it 'does not create a new Item' do
        expect do
          post '/api/v1/items', params: { item: invalid_attributes }, headers: {
            Authorization: "Bearer #{access_token}"
          }
        end.to_not change(Item, :count)
      end

      it 'renders a JSON response with errors for the new item' do
        post '/api/v1/items', params: { item: invalid_attributes }, headers: {
          Authorization: "Bearer #{access_token}"
        }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.content_type).to match(%r{^application/json})
        expect(response.body).to include("Name can't be blank")
        expect(response.body).to include('Description is too short (minimum is 3 characters)')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when authorized' do
      let(:item) { FactoryBot.create(:item) }
  
      before do
        delete "/api/v1/items/#{item.id}", headers: {
          Authorization: "Bearer #{access_token}"
        }
      end
  
      it 'deletes the item' do
        expect(Item.exists?(item.id)).to be_falsey
      end  
      it 'returns a success response' do
        expect(response).to have_http_status(:success)
      end
  
      it 'returns a JSON response with a success message' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response.body).to include('Item deleted')
      end
    end
  
  end
  
end
