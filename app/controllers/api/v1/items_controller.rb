class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])
    # refressh id
    if @item.destroy
      render json: { message: 'Item deleted' }
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :photo, :price, :mentor_name, :duration, :user_id)
  end
end
