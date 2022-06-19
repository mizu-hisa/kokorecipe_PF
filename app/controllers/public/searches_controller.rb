class Public::SearchesController < ApplicationController
  
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @recipes = Recipe.looks(params[:search], params[:word])
    end
  end

end
