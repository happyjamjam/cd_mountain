class OrdersController < OrderDetailsController

  def create
    calculation
    @order = Order.new
    @order.user_id = current_user.id
    @order.total_price = @final_price
    @order.postal_code = current_user.postal_code
    @order.shipping_address = current_user.address
    @order.shipping_name = current_user.full_name
    if @order.save
      create_order_details
      render :index
      current_user.carts.destroy
    else
      render :template => "carts/index"
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
    @payment = current_user
  	# 支払い関係カラム未作成のため変数作成不可

  end

  private

  def cart_params
    params.require(:order).permit(:user_id, :shipping_status, :total_price, :postal_code, :shipping_address, :shipping_name)
  end

end