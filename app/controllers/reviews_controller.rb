class ReviewsController < ApplicationController
  def new
  	@review = Review.new
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
end
