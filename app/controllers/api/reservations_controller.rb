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
  end

  private

  def current_user
    User.first
  end
end
