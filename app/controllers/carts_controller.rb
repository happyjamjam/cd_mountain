class CartsController < ApplicationController

  def index

  	calculation
    @cart_array = []
  end

  def create
    product = Product.find(params[:product_id])
  	cart_item = Cart.new(cart_params)
  	cart_item.user_id = current_user.id
    cart_item.product_id = product.id
    if current_user.carts.exists?(product_id: cart_item.product_id)
      existing_cart = current_user.carts.find_by(product_id: cart_item.product_id)
      existing_cart.quantity += cart_item.quantity
      if existing_cart.quantity > cart_item.product.stock
        existing_cart.quantity = cart_item.product.stock
      end
      existing_cart.save
    else
      cart_item.save
    end
    redirect_to carts_path
  end

  def update

  	@cart = Cart.find(params[:id])
  	@cart.user_id = current_user.id

  	@cart.update(cart_params)
  	redirect_to carts_path

  end

  def destroy

  	cart = Cart.find(params[:id])
  	cart.destroy
  	redirect_to carts_path

  end

  private

  def cart_params
  	params.require(:cart).permit(:quantity)
  end



end
