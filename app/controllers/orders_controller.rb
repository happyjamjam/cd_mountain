class OrdersController < ApplicationController

 def create

 	calculation

  	@order = Order.new
  	@order.total_price = @final_price

  	@order.save
    redirect_to orders_path

  end

  def show

  	calculation

  end

  def index

  	@user_orders = current_user.carts.order(id: "DESC")

  end

  def confirm

  	@user_orders = current_user.carts.order(id: "DESC")
    @payment = current_user
  	# 支払い関係カラム未作成のため変数作成不可

  end

end