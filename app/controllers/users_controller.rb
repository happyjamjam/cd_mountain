class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:show]

  def show
  	@user = current_user
    @orders = current_user.orders.page(params[:page]).per(10).order(id: "DESC")
    @favorite_products = @user.favorites.page(params[:page]).per(10)
    @addresses = @user.addresses
  end

  private

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
    end
  end
end