class Api::ReservationController < ApplicationController
  def index
    @reservation = Reservation.all
    render json: @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end
end
