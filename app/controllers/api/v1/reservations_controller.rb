module Api
  module V1
    class ReservationsController < ApiController
      before_action :doorkeeper_authorize!
      before_action :current_user
      respond_to :json
      def index
        if @current_user.nil?
          render json: { error: 'Not Authorized' }, status: :unauthorized
        else
          @reservations = @current_user.reservations
          render json: @reservations
        end
      end

      def create
        @item = Item.find_by(id: reservation_params[:item_id])
        allowed_params = reservation_params.except(:item_id)
        @reservation = Reservation.new(allowed_params)
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

      def reservation_params
        params.require(:reservation).permit(:date, :city, :item_id)
      end
    end
  end
end
