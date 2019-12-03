class ReviewsController < ApplicationController

  def index

  end

  def new
    if @movie = Movie.find_by_id (param[:movie_id])
      @review = @movie.reviews.build
    else
      @review = Review.new
    end 
  end

  def create

  end

  private
end
