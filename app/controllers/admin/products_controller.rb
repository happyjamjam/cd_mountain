class Admin::ProductsController < Admin::ApplicationController

  def new

  	@product = Product.new

  end

  def create

  	@product = Product.new(product_params)

  	@book.save
  	flash[:notice] = "Product was successfully created."
    redirect_to admin_products(current_admin)

  end

  def index

  	@products = Product.page(params[:page])

  end

  def edit

  	@product = Product.find(params[:id])

  end

  def update

    @product = Product.find(params[:id])

    if @product.update(_params)
      flash[:notice] = "Product was successfully updated."
      redirect_to product_path(@product.id)
    else
      render :edit
    end

  end

  def show

    @product = Product.find(params[:id])
    @reviews = @product.reviews.page(params[:page]).per(5)

  end

  def destroy

  	product = Product.find(params[:id])

  	product.destroy
  	flash[:notice] = "Product was successfully destroyed."
  	redirect_to admin_products_path

  end

  private

  def product_params
    params.require(:product).permit(:product_name, :label_id, :price, :genre_id, :stock, :sales_status)
  end

end
