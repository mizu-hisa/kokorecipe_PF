class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.all
    # reset_session
  end




end
