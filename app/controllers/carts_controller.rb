class CartsController < ApplicationController

  def index

  	@user_carts = current_user.carts.order(id: "DESC")

    @subtotal_price = 0
    @user_carts.each do |cart|
      @get_total_price = cart.product.price * cart.quantity
      @subtotal_price += @get_total_price
    end

    @tax = @subtotal_price * 0.08
    @final_price = @subtotal_price + @tax

  end

  def create

  	@cart_item = Cart.new(cart_params)
  	@cart_item.user_id = current_user.id

  	@cart_item.save
  	redirect_to carts_path(@cart)

  end

  def update

  	@cart = Cart.find(params[:id])
  	@cart.user_id = current_user.id

  	@cart.update(cart_params)
  	redirect_to carts_index_path(@cart)

  end

  def destroy

  	cart = Cart.find(params[:id])

  	cart.destroy
  	redirect_to carts_index_path(@cart)

  end

  private

  def cart_params
  	params.require(:cart).permit(:quantity, :product_id, :user_id)
  end



end
