class ShirtSizesController < ApplicationController
  before_action :set_shirt_size, only: %i[ show update destroy ]

  # GET /shirt_sizes
  def index
    @shirt_sizes = ShirtSize.all

    render json: @shirt_sizes
  end

  # GET /shirt_sizes/1
  def show
    render json: @shirt_size
  end

  # POST /shirt_sizes
  def create
    @shirt_size = ShirtSize.new(shirt_size_params)

    if @shirt_size.save
      render json: @shirt_size, status: :created, location: @shirt_size
    else
      render json: @shirt_size.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shirt_sizes/1
  def update
    if @shirt_size.update(shirt_size_params)
      render json: @shirt_size
    else
      render json: @shirt_size.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shirt_sizes/1
  def destroy
    @shirt_size.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shirt_size
      @shirt_size = ShirtSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shirt_size_params
      params.require(:shirt_size).permit(:size, :chest)
    end
end
