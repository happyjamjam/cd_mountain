class Admin::OrdersController < Admin::ApplicationController
  def index
  	@orders = Order.page(params[:page])
  end

  def show
  	@order = Order.find(params[:id])
  	@order_history = @order.order_details
  end
end
