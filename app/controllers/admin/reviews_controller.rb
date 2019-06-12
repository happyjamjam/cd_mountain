class Admin::ReviewsController < Admin::ApplicationController
  def edit
  	@review = Review.find(params[:id])
  end

  def destroy
  	user = User.find(params[:id])
  	review = Review.find(params[:id])
  	review.destroy
  	redirect_to admin_user_path
  end
end
