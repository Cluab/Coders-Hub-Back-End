class Api::V1::ItemsController < ApplicationController

    def all
        @items  = Item.all
        render json: @items
    end

    def add
        item = Item.new(item_params)
        if item.save
          render json: item, status: :created
        else
          render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :photo, :price, :mentor_name, :duration)
    end
end
