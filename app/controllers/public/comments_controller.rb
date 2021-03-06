class Public::CommentsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = current_customer.recipe_comments.new(recipe_comment_params)
    @comment.recipe_id = @recipe.id
    if @comment.save
      redirect_to recipe_path(@recipe.id)
    else
      @customer = @recipe.customer
      @recipe_comment = @comment
      render 'public/recipes/show'
    end
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
