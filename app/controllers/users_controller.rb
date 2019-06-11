class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:show]

  def show
  	@user = current_user
    @orders = current_user.orders.all
    @favorites = current_user.favorites.all
  end

  private

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
    end
  end
end