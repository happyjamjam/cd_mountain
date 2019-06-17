class OrdersController < OrderDetailsController

  def create
    calculation
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.total_price = @final_price
    @order.postal_code = current_user.postal_code
    @order.shipping_address = current_user.address
    @order.shipping_name = current_user.full_name
    if @order.save
      create_order_details
      render :index
      current_user.carts.destroy_all
    else
      redirect_to orders_confirm_path, notice: "エラー"
    end
  end

  def show
  	@order = Order.find(params[:id])
    @order_history = @order.order_details
  end

  def index

  end

  def confirm
    calculation
  	@user_orders = current_user.carts.order(id: "DESC")
    @order = Order.new
  	# 支払い関係カラム未作成のため変数作成不可

  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end

end