class Api::ReservationController < ApplicationController
  def show
    @reservation = reservation.find(params[:id])
    render json: @reservation
  end
end
