class Admin::ProductsController < Admin::ApplicationController

  def new

  	@product = Product.new

  end

  def create

  end

  def index

  	@products = Product.page(params[:page])

  end

  def edit

  end

  def update

  end

  def show

  @product = Product.find(params[:id])

  end

end
