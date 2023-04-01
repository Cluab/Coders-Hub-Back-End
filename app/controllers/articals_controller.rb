class ArticalsController < ApplicationController
  before_action :set_artical, only: %i[ show update destroy ]

  # GET /articals
  def index
    @articals = Artical.all

    render json: @articals
  end

  # GET /articals/1
  def show
    render json: @artical
  end

  # POST /articals
  def create
    @artical = Artical.new(artical_params)

    if @artical.save
      render json: @artical, status: :created, location: @artical
    else
      render json: @artical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articals/1
  def update
    if @artical.update(artical_params)
      render json: @artical
    else
      render json: @artical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articals/1
  def destroy
    @artical.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artical
      @artical = Artical.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artical_params
      params.require(:artical).permit(:name)
    end
end
