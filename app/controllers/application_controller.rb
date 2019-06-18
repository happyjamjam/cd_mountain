class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :search

	# carts / orders 共通計算用関数

	def calculation

		@user_carts = current_user.carts.order(id: "DESC")
		@subtotal_price = 0

		@user_carts.each do |cart|
			@get_total_price = cart.product.price * cart.quantity
		  @subtotal_price += @get_total_price
		end

		@tax = (@subtotal_price * 0.08).floor
		@final_price = @subtotal_price + @tax + 500

	end

	def search
		@q = Product.ransack(params[:q])
		@products = @q.result(distinct: true).page(params[:page])
	end

	protected

		def after_sign_in_path_for(resource)
   		user_path(current_user.id)
   	end

		def after_sign_up_path_for(resource)
   		user_path(current_user.id)
		end

		def after_sign_out_path_for(resource)
   		root_path
   	end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel])
  	end
end