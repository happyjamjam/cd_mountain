class OrdersController < ApplicationController

 def create

 	calculation

  	@order = Order.new
  	@order.total_price = @final_price

  	@order.save
    render :index

  end

  def show

  	calculation
    @order_histroty = current_user.orders.order(id: "DESC")

  end

  def index

  end

  def confirm

  	@user_orders = current_user.carts.order(id: "DESC")
    @payment = current_user
  	# 支払い関係カラム未作成のため変数作成不可

  end

  private

  def cart_params
    params.require(:order).permit(:user_id, :shipping_status, :total_price, :postal_code, :shipping_address, :shipping_name)
  end

end