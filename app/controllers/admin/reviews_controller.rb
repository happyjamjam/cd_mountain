class Admin::ReviewsController < Admin::ApplicationController
  def edit
  	@review = Review.find(params[:id])
  	@product = @review.product
    @genre = @product.genre
    @label = @product.label
    # @artist =@product.artist_id
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_user_path(review.user)
  end


  def destroy
    review = Review.find(params[:id])
    review.destroy
  	redirect_to admin_user_path(review.user)
  end

private
  def review_params
    params.require(:review).permit(:name,:title, :body)
  end

end
