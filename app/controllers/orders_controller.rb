class OrdersController < OrderDetailsController

  require 'payjp'

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
      if @order.save
        create_order_details
        render :index
        @user_carts.destroy_all
        return
      else
        redirect_to orders_confirm_path
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
    if params[:address_id] != nil
      @address = Address.find(params[:address_id])
    end
  	# 支払い関係カラム未作成のため変数作成不可

  end

  def pay
    calculation
    Payjp.api_key = 'sk_test_e07dda9bc6db99d0c64abe79'
    Payjp::Charge.create(
      amount: @final_price, # 決済する値段
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_name, :shipping_address, :postal_code, :tel)
  end

end