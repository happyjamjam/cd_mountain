class Admin::ProductsController < Admin::ApplicationController

  def new

  	@product = Product.new

  end

  def create

  	@product = Product.new(product_params)

  	@book.save
    redirect_to admin_products(current_admin)

  end

  def index

  	@products = Product.page(params[:page])

  end

  def edit

  	@ = Product.find(params[:id])

  end

  def update

    @cart = Product.find(params[:id])

    if @cart.update(_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  def show

    @product = Product.find(params[:id])
    @reviews = @product.reviews.page(params[:page]).per(5)

  end

  def destroy

  end

  private

  def product_params
    params.require(:product).permit(:product_name, :label_id, :price, :genre_id, :stock, :sales_status)
  end

end
