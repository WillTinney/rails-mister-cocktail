class DosesController < ApplicationController
  before_action :set_cocktail, only: [ :new, :create, :destroy ]

  # GET /doses
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @cocktail, notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  # DELETE /doeses/1
  def destroy
    @dose.destroy
    redirect_to doses_url, notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
