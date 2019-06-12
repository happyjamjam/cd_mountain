class OrderController < ApplicationController

  def create

  end

  def show

  end

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

end
