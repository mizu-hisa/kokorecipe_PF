class Public::RecipeCommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:id])
    @comment = current_customer.recipe_comments.new(recipe_comment_params)
    @comment.recipe_id = @recipe.id
    @comment.save
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    RecipeComment.find(params[:id]).destroy
    redirect_to recipe_path(@recipe)
  end



  private

  def recipe_comment_params
    params.require(:recipe_comment).permit(:comment)
  end


end
