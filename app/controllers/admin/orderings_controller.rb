class Admin::OrderingsController < Admin::ApplicationController
  def index
  	@orders = Ordering.page(params[:page])
  end

  def show
  	@order = Ordering.find(params[:id])
  	@order_items = @order.order_details
  end
end
