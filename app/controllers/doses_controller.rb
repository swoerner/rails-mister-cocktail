class DosesController < ApplicationController

  def create
    # Needs an ingredient and a cocktail
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # Puts a value of cocktail's ID in a doses' FK
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
