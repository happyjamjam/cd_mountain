class ReviewsController < ApplicationController
  def new
    @product =Product.find(params[:product_id])
    @review = Review.new
    @genre = @product.genre
    @label = @product.label
    @artist_products =@product.artist_products
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
    @product =Product.find(params[:product_id])
    @genre = @product.genre
    @label = @product.label
    @artist_products =@product.artist_products

  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to user_path
  end

  def destroy
  	review = Review.find(params[:id])
  	review.destroy
    redirect_to product_path(params[:product_id])
  end

private
  def review_params
    params.require(:review).permit(:product_id, :name, :title, :body)
  end
end
