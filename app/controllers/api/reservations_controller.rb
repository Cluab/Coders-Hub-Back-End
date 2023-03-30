class Api::ReservationsController < ApplicationController
  attr_accessor :current_user

  def index
    @data = User.find(current_user.id).reservations.map do |reservation|
      {
        city: reservation.city,
        date: reservation.date,
        item_name: reservation.item.name
      }
    end

    render json: @data

    if @_response
      @_response.media_type
    end
  end

   def create

    @reservation = Reservation.create(
        date:params[:date],
        city:params[:city],
        user:current_user,
        item:current_item
    )
    render json: @reservation
end

  private

  def current_user
    User.first
  end

  def current_item
    Car.first
  end
end
