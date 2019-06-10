class UsersController < ApplicationController
before_action :authenticate_user!

def show
  	@user = current_user
    @orders = current_user.orders.all
    @favorites = current_user.favorites.all
  end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :encrypted_password, :postal_code, :address, :tel)
  end

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
    end
  end
end