class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
  	@genre = @product.genre
  	@label = @product.label
  	@disks = @product.disks.all
  	@musics = @disks.musics.all
  	@artists = @musics.artist.all
  end
end
