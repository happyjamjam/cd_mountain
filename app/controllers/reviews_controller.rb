class ReviewsController < ApplicationController
  def new
  	@review = Review.new
    @product =Product.find(params[:id])
    @genre = @product.genre_id
    @label = @product.label_id
    @artist =@product.artist_id
  end

  def create
  	@review = Review.new(review_params)
    if @review.save
     redurect_to product_path
    else
     render "new"
　　 end
  end


  def edit
  end

  def update
  end

  def destroy
  	reviews = review.find(params[:id])
  	reviews.destroy
  end

private
  def review_params
        params.require(:review).permit(:name,:title, :body)
  end
end
