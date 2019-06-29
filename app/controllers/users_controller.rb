class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:show]

  def show
  	@user = current_user
    @orders = current_user.orders.page(params[:page]).per(10).order(id: "DESC")
    @favorite_products = @user.favorites.page(params[:page]).per(10)
    @addresses = @user.addresses
    if current_user.cards.exists?
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  private

  def correct_user
  	user = User.find(params[:id])
  	if current_user != user
  		redirect_to user_path(current_user)
    end
  end
end