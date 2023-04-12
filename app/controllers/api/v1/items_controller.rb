module Api
  module V1
    class ItemsController < ApiController
      # before_action :set_item, only: %i[show edit update destroy]
      before_action :doorkeeper_authorize!
      before_action :current_user
      respond_to :json

      def index
        @items = Item.all
        render json: @items, status: :ok
      end

      def show
        @item = Item.find(params[:id])
        render json: @item, status: :ok
      end

      def create
        if @current_user.admin?
          item = Item.new(item_params)
          if item.save
            render json: item, status: :created
          else
            render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
          end

        else
          render json: { error: 'Not Authorized' }, status: :unauthorized
        end
      end

      # DELETE /items/1
      def destroy
        if @current_user.admin?
          @item = Item.find(params[:id])
          # refressh id
          if @item.destroy
            render json: { message: 'Item deleted' }
          else
            render json: @reservation.errors, status: :unprocessable_entity
          end
        else
          render json: { error: 'Not Authorized' }, status: :unauthorized
        end
      end

      private

      def item_params
        params.require(:item).permit(:name, :description, :photo, :price, :mentor_name, :duration, :user_id)
      end
    end
  end
end
