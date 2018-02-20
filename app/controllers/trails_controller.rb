class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :update, :destroy]

  # GET /trails
  # GET /trails.json
  def index
    @trails = Trail.all
  end

  # GET /trails/1
  # GET /trails/1.json
  def show
  end

  # POST /trails
  # POST /trails.json
  def create
    @trail = Trail.new(trail_params)

    if @trail.save
      render :show, status: :created, location: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trails/1
  # PATCH/PUT /trails/1.json
  def update
    if @trail.update(trail_params)
      render :show, status: :ok, location: @trail
    else
      render json: @trail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trails/1
  # DELETE /trails/1.json
  def destroy
    @trail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trail_params
      params.require(:trail).permit(:name, :difficulty, :resort_id)
    end
end
