class OrdersController < ApplicationController

 def create

 	calculation

  	@order = Order.new
  	@order.total_price = @final_price

  	@order.save
    # リダイレクトの設定

  end

  def show

  end

  def index
  	calculation
  end

  def confirmaration

  end

end