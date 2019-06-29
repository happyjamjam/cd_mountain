class CardsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery
  require "payjp"
  require "dotenv"
  Dotenv.load

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params[:payjp_token].blank?
      redirect_to orders_confirm_path
    else
      customer = Payjp::Customer.create(
      card: params[:payjp_token],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to orders_confirm_path
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to current_user
  end
end