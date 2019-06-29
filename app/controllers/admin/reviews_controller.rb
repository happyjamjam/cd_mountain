class Admin::ReviewsController < Admin::ApplicationController
  def edit
  	@review = Review.find(params[:id])
  	@product =Product.find(params[:product_id])
    @genre = @product.genre
    @label = @product.label
    # @artist =@product.artist_id
  end

  def update
    review = Review.find(params[:id])
    user = review.user
    review.update(review_params)
    redirect_to admin_user_path(user.id)
  end


  def destroy
  	review = Review.find(params[:id])
    user = review.user
  	review.destroy
  	redirect_to admin_user_path(user.id)
  end

private
  def review_params
    params.require(:review).permit(:name,:title, :body)
  end

end
