class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.all
    @recipes = Recipe.all.page(params[:page]).per(10)
    # reset_session
  end




end
