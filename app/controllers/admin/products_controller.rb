class Admin::ProductsController < Admin::ApplicationController

  def new
    @genre = Genre.new
    @label = Label.new
    @product = Product.new
    @disk = @product.disks.build
    @music = @disk.musics.build
  end

  def create
    # @genre = Genre.new(genre_params)
    @genre = Genre.find_or_create_by(genre_name: params[:genre][:genre_name])

    # @label = Label.new(label.params)
    @label = Label.find_or_create_by(label_name: params[:label][:label_name])

  	@product = Product.new(product_params)
      @product.genre_id = @genre.id
      @product.label_id = @label.id
    @product.save!
    redirect_to admin_path
  rescue
    render action: 'new'
  end

  def index
  	@products = Product.page(params[:page])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
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
    params.require(:product).permit(:product_name, :price, :stock, :sales_status, disks_attributes: [:id, :product_id, :disk_number, :_destroy, musics_attributes: [:id, :disk_id, :artist_id, :music_title, :track_number, :_destroy, ]])
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def label_params
    params.require(:label).permit(:label_name)
  end
end
