class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new
    @recipe.title = params[:recipe][:title]
    @recipe.body = params[:recipe][:body]

    if @recipe.save
      flash[:notice] = "Recipe was saved."
      redirect_to @recipe
    else
      flash.now[:alert] = "There was an error saving the recipe. Please try again."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.title = params[:recipe][:title]
    @recipe.body = params[:recipe][:body]

    if @recipe.save
      flash[:notice] = "Recipe was updated."
      redirect_to @recipe
    else
      flash.now[:alert] = "There was an error updating the recipe. Please try again."
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "Recipe was deleted successfully."
      redirect_to recipes_path
    else
      flash.now[:alert] = "There was an error deleting the recipe. Please try again."
      render :show
    end
  end
end
