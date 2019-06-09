class ReviewsController < ApplicationController
  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)

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
