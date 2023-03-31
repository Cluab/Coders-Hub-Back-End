class Api::V1::ItemsController < ApplicationController

    def all
        @items  = Item.all
        render json: @items
    end


    private

    def item_params
        params.require(:item).permit(:name, :description, :photo, :price, :mentor_name, :duration)
    end
end
