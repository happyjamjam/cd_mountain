class ProductsController < ApplicationController
  def index
  	# @products = Product.page(params[:page])
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
    @all_ranks = Product.find(Favorite.group(:product_id).order('count(product_id) desc').limit(5).pluck(:product_id))
  end

  def show
  	@product = Product.find(params[:id])
  	@genre = @product.genre
  	@label = @product.label
  	@disks = @product.disks
    @artist_products = @product.artist_products
  	@reviews = @product.reviews.page(params[:page]).per(5)
    @cart = Cart.new

    if @product.stock != 0
      @stock_array = []
      (1..@product.stock).each do |s|
        new_array = [s, s]
        @stock_array.push(new_array)
      end
    end
  end
end
