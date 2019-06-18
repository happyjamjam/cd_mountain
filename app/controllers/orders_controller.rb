class OrdersController < OrderDetailsController

  def create
    calculation
    # 在庫が注文数よりも多いかをチェック
    @user_carts.each do |cart|
      if cart.product.stock < cart.quantity # 在庫が注文数よりも少なければカートに戻る
        redirect_to carts_path, notice: "在庫数が変更されました。注文枚数を選択し直してください。"
        return
      end
    end
    # チェック終了
    unless current_user.carts.exists?
      redirect_to carts_path
    else
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.total_price = @final_price
      @order.postal_code = current_user.postal_code
      @order.shipping_address = current_user.address
      @order.shipping_name = current_user.full_name
      if @order.save
        create_order_details
        render :index
        @user_carts.destroy_all
        return
      else
        redirect_to orders_confirm_path, notice: "お支払い方法を選択してください。"
        return
      end
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