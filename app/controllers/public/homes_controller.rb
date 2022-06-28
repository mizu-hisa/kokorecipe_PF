class Public::HomesController < ApplicationController
  def top
    @recipes = Recipe.page(params[:page]).per(10).order("created_at DESC")
    # reset_session
  end




end
