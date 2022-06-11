class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
    @recipes = @customer.recipes
  end

  def edit
  end
end
