class ProductsController < ApplicationController
  def index
  	# @products = Product.page(params[:page])
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
  	@genre = @product.genre
  	@label = @product.label
  	@disks = @product.disks
    #@artists
  	@reviews = @product.reviews.page(params[:page]).per(5)
    @cart = Cart.new

    if @product.stock != 0
      @array = []
      (1..@product.stock).each do |s|
        new_array = [s, s]
        @array.push(new_array)
      end
    end
  end
end
