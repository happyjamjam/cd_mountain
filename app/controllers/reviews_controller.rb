class ReviewsController < ApplicationController
  def new
    @product =Product.find(params[:product_id])
    @review = Review.new
    @genre = @product.genre
    @label = @product.label
    #@artist =@product.disks.musics.artist.artist_id
  end

  def create
    @product =Product.find(params[:product_id])
    @genre = @product.genre
    @label = @product.label
  	@review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save
     redirect_to product_path(@product)
    else
     render :template => "reviews/new"
    end
  end


  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to user_path
  end

  def destroy
  	reviews = review.find(params[:id])
  	reviews.destroy
    redirect_to user_path
  end

private
  def review_params
    params.require(:review).permit(:product_id, :name, :title, :body)
  end
end
