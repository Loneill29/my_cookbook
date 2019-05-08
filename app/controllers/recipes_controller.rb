class RecipesController < ApplicationController
  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @recipe = Recipe.new
  end

  def create
    @category = Category.find(params[:category_id])
    @recipe = Recipe.new
    @recipe.title = params[:recipe][:title]
    @recipe.ingredient = params[:recipe][:ingredient]
    @recipe.body = params[:recipe][:body]

    @recipe.category = @category

    if @recipe.save
      flash[:notice] = "Recipe was saved."
      redirect_to [@category, @recipe]
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
    @recipe.ingredient = params[:recipe][:ingredient]
    @recipe.body = params[:recipe][:body]

    if @recipe.save
      flash[:notice] = "Recipe was updated."
      redirect_to [@recipe.category, @recipe]
    else
      flash.now[:alert] = "There was an error updating the recipe. Please try again."
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "Recipe was deleted successfully."
      redirect_to @recipe.category
    else
      flash.now[:alert] = "There was an error deleting the recipe. Please try again."
      render :show
    end
  end
end
