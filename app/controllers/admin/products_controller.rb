class Admin::ProductsController < Admin::ApplicationController

  def new
    @genre = Genre.new
    @label = Label.new
    @artist = Artist.new
    @product = Product.new
    @disk = @product.disks.build
    @music = @disk.musics.build
  end

  def create
    @genre = Genre.find_or_create_by(genre_name: params[:genre][:genre_name])
    @label = Label.find_or_create_by(label_name: params[:label][:label_name])
  	@product = Product.new(create_product_params)
    @product.genre_id = @genre.id
    @product.label_id = @label.id
    artist_hash = params[:product][:artists_attributes]
    if @product.save
      artist_hash.values.each do |value|
        unless Artist.find_by(artist_name: value[:artist_name])
          @artist = Artist.new
          @artist.artist_name = value[:artist_name]
          @artist.save
        end
        artist = Artist.find_by(artist_name: value[:artist_name])
        artist_product = ArtistProduct.new
        artist_product.artist_id = artist.id
        artist_product.product_id = @product.id
        artist_product.save
      end
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
  	@products = Product.page(params[:page])
  end

  def edit
  	@product = Product.find(params[:id])
    @genre = @product.genre
    @label = @product.label
    @artist_products = @product.artist_products
  end

  def update
    @product = Product.find(params[:id])
    @genre = Genre.find(@product.genre_id)
    @label = Label.find(@product.label_id)
    @genre.update(genre_params)
    @label.update(label_params)
    # artist_hash = params[:product][:artists_attributes]
    # artist_hash.values.each do |value|
    #   unless Artist.find_by(artist_name: value[:artist_name])
    #     @artist = Artist.new
    #     @artist.artist_name = value[:artist_name]
    #     @artist.save
    #   end
    #   artist = Artist.find_by(artist_name: value[:artist_name])
    # end
    if @product.update(update_product_params)
        redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @disks = @product.disks
    @artist_products = @product.artist_products
    @reviews = @product.reviews.page(params[:page]).per(5)
  end

  def destroy
  	product = Product.find(params[:id])
  	product.destroy
  	flash[:notice] = "Product was successfully destroyed."
  	redirect_to admin_products_path
  end

  private

  def create_product_params
    params.require(:product).permit(:product_name, :price, :stock, :sales_status, :jacket_img, artist_products_attributes: [:id, :artist_id, :_destroy], disks_attributes: [:id, :product_id, :disk_number, :_destroy, musics_attributes: [:id, :disk_id, :artist_id, :music_title, :track_number, :_destroy]])
  end

  def update_product_params
    params.require(:product).permit(:product_name, :price, :stock, :sales_status, :jacket_img, artists_attributes: [:id, :artist_name, :_destroy], artist_products_attributes: [:id, :artist_id, :_destroy], disks_attributes: [:id, :product_id, :disk_number, :_destroy, musics_attributes: [:id, :disk_id, :artist_id, :music_title, :track_number, :_destroy]])
  end

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

  def label_params
    params.require(:label).permit(:label_name)
  end

  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
