class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    ingredient = @recipe.ingredients.new(ingredient_params)

    if ingredient.save
      redirect_to @recipe
    else
      flash.now[:notice] = "Ingredient failed to save. Please try again."
      redirect_to @recipe
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    ingredient = @recipe.ingredients.find(params[:id])

    if ingredient.destroy
      redirect_to @recipe
    else
      flash.now[:notice] = "Ingredient couldn't be deleted. Please try again."
      redirect_to @recipe
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:body)
  end 

end
