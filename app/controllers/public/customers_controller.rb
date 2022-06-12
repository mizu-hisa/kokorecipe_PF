class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
    @recipes = @customer.recipes
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end


  private

  def customer_params
    params.require(:customer).permit(:customer_name, :profile_image)
  end


end
