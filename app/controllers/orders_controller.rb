class OrdersController < ApplicationController

  def create
    calculation
    @order = Order.new
    @order.user_id = current_user.id
    @order.total_price = @final_price
    if @order.save
      @user_carts.destroy
      render :index
    else
      render :template => "carts/index"
    end
  end

  def show
  	@order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def index

  end

  def confirm
    calculation
  	@user_orders = current_user.carts.order(id: "DESC")
    @payment = current_user
  	# 支払い関係カラム未作成のため変数作成不可

  end

  private

  def cart_params
    params.require(:order).permit(:user_id, :shipping_status, :total_price, :postal_code, :shipping_address, :shipping_name)
  end

end