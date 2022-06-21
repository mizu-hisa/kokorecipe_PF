class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
    @customers=Customer.all.page(params[:page]).per(10)
  end

  def show
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @customers = Customer.all
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path
    else
      @customers = Customer.all
      render "edit"
    end
  end



  def customer_params
    params.require(:customer).permit(:customer_name, :is_deleted)
  end
end
