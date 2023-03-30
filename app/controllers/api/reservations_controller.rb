class Api::ReservationsController < ApplicationController
  attr_accessor :current_user

  def index
    @data = User.find(current_user.id).reservations.map do |reservation|
      {
        id: reservation.id,
        city: reservation.city,
        date: reservation.date,
        name: reservation.item.name,
        photo: reservation.item.photo,
        price: reservation.item.price,
        mentor_name: reservation.item.mentor_name,
        duration: reservation.item.duration
      }
    end

    render json: @data

    if @_response
      @_response.media_type
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @current_user
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: @reservation
  end

  private

  def reservation_params
    params.permit(:date, :city, :country, :item_id)
  end
end
