class OrdersController < OrderDetailsController

  protect_from_forgery
  require 'payjp'
  require 'dotenv'
  Dotenv.load

  def confirm
    if current_user.cards.exists?
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    calculation
    @user_orders = current_user.carts.order(id: "DESC")
    @order = Order.new
    if params[:address_id] != nil
      @address = Address.find(params[:address_id])
    end
  end


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
    if !current_user.carts.exists?
      redirect_to carts_path
    else
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      @order.total_price = @final_price
      # 支払い方法にクレジットを選択しているのにカード情報を登録していない場合、リダイレクトする
      if !current_user.cards.exists? && @order.payment_method == "クレジット"
        redirect_to orders_confirm_path, notice: "カード情報を登録してください。"
        return
      end
      if @order.save
        if @order.payment_method == "クレジット"
          pay
        end
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

  private

  def pay
    calculation
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
      amount: @final_price, # 決済する金額
      customer: card.customer_id,
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order).permit(:payment_method, :shipping_name, :shipping_address, :postal_code, :tel)
  end

end