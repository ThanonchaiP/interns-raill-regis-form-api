class SubDistrictsController < ApplicationController
  before_action :set_sub_district, only: %i[ show update destroy ]

  # GET /sub_districts
  def index
    @sub_districts = SubDistrict.search_district(params[:search_district])

    render json: @sub_districts
  end

  # GET /sub_districts/1
  def show
    render json: @sub_district
  end

  # POST /sub_districts
  def create
    @sub_district = SubDistrict.new(sub_district_params)

    if @sub_district.save
      render json: @sub_district, status: :created, location: @sub_district
    else
      render json: @sub_district.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_districts/1
  def update
    if @sub_district.update(sub_district_params)
      render json: @sub_district
    else
      render json: @sub_district.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_districts/1
  def destroy
    @sub_district.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_district
      @sub_district = SubDistrict.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_district_params
      params.require(:sub_district).permit(:name, :code, :name_th, :post_code, :district_id)
    end
end
