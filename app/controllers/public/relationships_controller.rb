class Public::RelationshipsController < ApplicationController

  # フォローするとき
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
  # フォロー一覧
  def followings
    customer = current_customer
    @customers = customer.followings
  end
  # フォロワー一覧
  def followers
    @customer = current_customer
    @customers = @customer.followers
  end

end