class ReviewsController < ApplicationController

  def index

  end

  def new
    if @movie = Movie.find_by_id(params[:movie_id])
       @review = @movie.reviews.build
    else
       @review = Review.new
    end
  end

  def create
    @review =
    current_user.reviews.build(review_params)
    if @review.save
        redirect_to review_path(@review)
    else
        render :new
    end
  end

  private
  def review_params
         params.require(:review).permit(:stars, :title, :content, :movie_id)
  end
end
