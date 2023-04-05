class Api::V1::ReservationsController < ApplicationController
  before_action :set_item, only: [:create]
  before_action :set_current_user, only: %i[create show]

  def index
    @reservation = Reservation.all
    @reservation = @reservation.sample
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)

    @reservation.item = @item
    @reservation.user = @current_user
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_current_user
    @current_user = User.find(session[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :city)
  end
end
