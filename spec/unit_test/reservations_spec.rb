require 'rails_helper'

#Set up with the type: :controller to test  the controller actions directly.



RSpec.describe ReservationsController, type: :controller do
  describe "POST #create" do
    let(:item) { create(:item) }
    let(:user) { create(:user) }

    #When the parameters are valid  

    context "with valid params" do

      #  Whether a new reservation has been created,
      it "creates a new reservation" do
        expect {
          post :create, params: { item_id: item.id, reservation: { date: Date.tomorrow, city: 'New York' } }, session: { user_id: user.id }
        }.to change(Reservation, :count).by(1)
      end

      # Whether the controller returns a JSON response with the created reservation.
      it "returns a JSON response with the new reservation" do
        post :create, params: { item_id: item.id, reservation: { date: Date.tomorrow, city: 'New York' } }, session: { user_id: user.id }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)).to include('id', 'date', 'city', 'item_id', 'user_id', 'created_at', 'updated_at')
      end
    end

    #when the parameters are invalid  

    context "with invalid params" do

      #The controller should return a JSON response with errors.
      
      it "returns a JSON response with errors" do
        post :create, params: { item_id: item.id, reservation: { date: nil, city: 'New York' } }, session: { user_id: user.id }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
        expect(JSON.parse(response.body)).to include('date')
      end
    end
  end
end
 
