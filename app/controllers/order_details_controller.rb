class OrderDetailsController < ApplicationController
	def create_order_details
		@user_carts.each do |cart|
			order_detail = OrderDetail.new
			order_detail.order_id = @order.id
			order_detail.product_id = cart.product.id
			order_detail.purchase_price = cart.product.price
			order_detail.purchase_quantity = cart.quantity
			order_detail.save
		end
	end
end
