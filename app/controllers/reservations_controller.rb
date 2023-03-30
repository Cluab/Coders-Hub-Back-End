class ReservationsController < ApplicationController
  #sets the @item instance variable to the item specified in the params hash
  before_action :set_item, only: [:create]
  #calls the set_current_user method before both the create and show actions are executed. 
  #sets the @current_user instance variable to the user specified in the session hash.

  before_action :set_current_user, only: [:create, :show]

 # creates a new Reservation object with the attributes specified in the reservation_params method.

  def create
    @reservation = Reservation.new(reservation_params)

    #sets the item and user attributes to the corresponding instance variables

    @reservation.item = @item
    @reservation.user = @current_user
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end
  #retrieves all reservations associated with the current user and renders a JSON response with these reservations.

  def show
    @reservations = Reservation.where(user_id: @current_user.id)
    render json: @reservations
  end

 #helper methods
  private

 #finds the item specified in the params hash and sets it to the @item instance variable.

  def set_item
    @item = Item.find(params[:item_id])
  end

 #finds the user specified in the session hash and sets it to the @current_user instance variable.

  def set_current_user
    @current_user = User.find(session[:user_id])
  end

 #whitelists the date and city attributes from the params hash for use in creating a new Reservation object.
  def reservation_params
    params.require(:reservation).permit(:date, :city)
  end
end
