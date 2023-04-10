require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

    describe "GET #index" do
     it "returns a success response" do
        get :index
        expect(response).to be_successful
      end
  
      it "returns all items" do
        item1 = FactoryBot.create(:item)
        item2 = FactoryBot.create(:item)
        get :index
        expect(assigns(:items)).to match_array([item1, item2])
      end
    end
  
    describe "POST #create" do
      context "with valid parameters" do
        let(:valid_attributes) do
          {
            name: "Mancoba",
            photo: "https://avatars.githubusercontent.com/u/53082877?s=400&u=8432a4860f75013af57e50bbbd974a89e51e94c9&v=4",
            description: "This is the last class item",
            price: 20,
            mentor_name: "Front-End Mentor",
            duration: "2hours"
          }
        end
  
        it "creates a new Item" do
          expect {
            post :create, params: { item: valid_attributes }
          }.to change(Item, :count).by(1)
        end
  
        it "renders a JSON response with the new item" do
          post :create, params: { item: valid_attributes }
          expect(response).to have_http_status(:created)
          expect(response.content_type).to eq('application/json; charset=utf-8')
          expect(response.content_type).to match(/^application\/json/)
          expect(response.body).to include(valid_attributes[:name])
        end
      end
  
      context "with invalid parameters" do
        let(:invalid_attributes) do
          {
            name: "",
            description: "",
            price: "",
            duration: ""
          }
        end
  
        it "does not create a new Item" do
          expect {
            post :create, params: { item: invalid_attributes }
          }.to_not change(Item, :count)
        end
  
        it "renders a JSON response with errors for the new item" do
          post :create, params: { item: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json; charset=utf-8')
          expect(response.content_type).to match(/^application\/json/)
          expect(response.body).to include("Name can't be blank")
          expect(response.body).to include("Description is too short (minimum is 3 characters)")
        end
      end
    end
  end
  