class ProductsController < ApplicationController
  def index
  	# @products = Product.page(params[:page])
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
  	@genre = @product.genre_id
  	@label = @product.label_id
  	@disks = @product.disks.all
  	# @musics = @disks.musics.all
  	#@artists = @musics.artist.all
  	@reviews = @product.reviews.page(params[:page]).per(5)
    @cart = Cart.new(user_id: current_user.id, product_id: @product.id)
  end

end
