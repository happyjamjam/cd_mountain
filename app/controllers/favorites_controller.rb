class FavoritesController < ApplicationController
	before_action :set_product

	def create
		product = Product.find(params[:product_id])
		favorite = current_user.favorites.new(product_id: product.id)
		favorite.save
	end

	def destroy
		product = Product.find(params[:product_id])
		favorite = Favorite.find_by(product_id: params[:product_id], user_id: current_user)
		favorite.destroy
	end

	private

	def set_product
		@product = Product.find(params[:product_id])
	end

end
