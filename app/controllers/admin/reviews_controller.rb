class Admin::ReviewsController < Admin::ApplicationController
  def edit
  	@review = Review.find(params[:id])
  	@product =Product.find(params[:id])
    @genre = @product.genre_id
    @label = @product.label_id
    @artist =@product.artist_id
  end

  def updeta
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to admin_user_path
  end
  	
  end

  def destroy
  	user = User.find(params[:id])
  	review = Review.find(params[:id])
  	review.destroy
  	redirect_to admin_user_path
  end


end
