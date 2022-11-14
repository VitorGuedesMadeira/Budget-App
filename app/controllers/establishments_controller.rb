class EstablishmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_establishment, only: %i[ show edit update destroy ]

  # GET /establishments or /establishments.json
  def index
    @establishments = Establishment.all
  end

  # GET /establishments/1 or /establishments/1.json
  def show
  end

  # GET /establishments/new
  def new
    @establishment = Establishment.new
  end

  # GET /establishments/1/edit
  def edit
  end

  # POST /establishments or /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to establishment_url(@establishment), notice: "Establishment was successfully created." }
        format.json { render :show, status: :created, location: @establishment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establishments/1 or /establishments/1.json
  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to establishment_url(@establishment), notice: "Establishment was successfully updated." }
        format.json { render :show, status: :ok, location: @establishment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1 or /establishments/1.json
  def destroy
    @establishment.destroy

    respond_to do |format|
      format.html { redirect_to establishments_url, notice: "Establishment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def establishment_params
      params.require(:establishment).permit(:name, :amount)
    end
end
