class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.name = params[:category][:name]

    if @category.save
      redirect_to @category, notice: "Category saved successfully."
    else
      flash.now[:alert] = "There was a problem saving the category. Please try again."
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:category][:name]

    if @category.save
      flash[:notice] = "Category was saved successfully."
      redirect_to @category
    else
      flash.now[:alert] = "There was a problem saving the category. Please try again."
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      flash[:notice] = "\"#{@category.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the category."
      render :show
    end 
  end
end
