class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show update destroy ]
  before_action :verify_token, only: [:index, :destroy]

  # GET /clients
  def index
    @clients = Client.search_id(params[:search_id],params[:search_name],params[:search_lastname]).offset(params[:numoffset]).limit(params[:numlim])

    render json: @clients
  end

  # GET /clients/1
  def show
    render json: @client.as_image_json
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client.as_image_json, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find_by_id(params[:id])
      if @client.nil?
        raise NotFoundError.new("ไม่พบผู้ใช้งานนี้ในระบบ")
      end
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :gender_id, :birthday, :phone, :email, :race_id, :shirt_size_id, :image)
    end
end