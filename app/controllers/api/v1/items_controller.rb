# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApiController
      # before_action :set_item, only: %i[show edit update destroy]
      def index
        @items = Item.all
        render json: @items
      end

      def create
        item = Item.new(item_params)
        if item.save
          render json: item, status: :created
        else
          render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @item = Item.find(params[:id])
        @item.destroy
        render json: { message: 'Item deleted' }, status: :ok
      end

      def show
        @item = Item.find(params[:id])
        render json: @item
      end

      private

      def item_params
        params.require(:item).permit(:name, :description, :photo, :price, :mentor_name, :duration)
      end
    end
  end
end
