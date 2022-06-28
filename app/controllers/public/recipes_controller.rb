class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer = current_customer
    if @recipe.save
      redirect_to customers_my_page_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all.page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @customer = @recipe.customer
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to customers_my_page_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to customers_my_page_path
  end


  # 投稿データのストロングパラメータ
  private

  def recipe_params
    params.require(:recipe).permit(:title, :detail, :image)
  end
end

