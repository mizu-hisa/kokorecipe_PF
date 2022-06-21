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
    redirect_to customers_my_page_path
  end

  def withdrawal

    @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:customer_name, :profile_image, :introduction)
  end


end
