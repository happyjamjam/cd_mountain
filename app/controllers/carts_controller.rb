class CartsController < ApplicationController

  def index

  	calculation

  end

  def create
  	@cart_item = Cart.new(cart_params)
  	@cart_item.user_id = current_user.id
  	@cart_item.save
  	redirect_to carts_path(current_user)

  end

  def update

  	@cart = Cart.find(params[:id])
  	@cart.user_id = current_user.id

  	@cart.update(cart_params)
  	redirect_to carts_path(@cart)

  end

  def destroy

  	cart = Cart.find(params[:id])

  	cart.destroy
  	redirect_to carts_path(@cart)

  end

  private

  def cart_params
  	params.require(:cart).permit(:quantity, :product_id, :user_id)
  end



end
