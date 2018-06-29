class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    ingredient_id = params[:dose][:ingredient]
    cocktail_id = params[:cocktail_id]

    new_dose = Dose.new(dose_params)
    new_dose.ingredient = Ingredient.find(ingredient_id)
    new_dose.cocktail = Cocktail.find(cocktail_id)
    new_dose.save!
    redirect_to cocktail_path(Cocktail.find(cocktail_id))
  end

  def destroy
    current_dose = Dose.find(params[:id])
    current_cocktail = current_dose.cocktail
    current_dose.destroy
    redirect_to cocktail_path(Cocktail.find(current_cocktail.id))
  end


  private
  def dose_params
    params.require(:dose).permit(:description)
  end
end
