class ResortsController < ApplicationController
  before_action :set_resort, only: [:show, :update, :destroy]

  # GET /resorts
  # GET /resorts.json
  def index
    @resorts = Resort.all
  end

  # GET /resorts/1
  # GET /resorts/1.json
  def show
  end

  # POST /resorts
  # POST /resorts.json
  def create
    @resort = Resort.new(resort_params)

    if @resort.save
      render :show, status: :created, location: @resort
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resorts/1
  # PATCH/PUT /resorts/1.json
  def update
    if @resort.update(resort_params)
      render :show, status: :ok, location: @resort
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resorts/1
  # DELETE /resorts/1.json
  def destroy
    @resort.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resort
      @resort = Resort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resort_params
      params.require(:resort).permit(:name)
    end
end
