class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :destroy]
  before_action :set_ingredient, only: :create


  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    end

    def dose_params
      params.require(:dose).permit(:description)
    end
end

