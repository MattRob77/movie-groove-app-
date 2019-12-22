class ReviewsController < ApplicationController

  def index
    if @movie = Movie.find_by_id(params[:movie_id])
      @reviews = @movie.reviews.all
    else
      @reviews = Review.all
    end
  end

  def new
    if @movie = Movie.find_by_id(params[:movie_id])
       @review = @movie.reviews.build
    else
       @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params) #Stored in private (review_params)
    if @review.save
        redirect_to review_path(@review)
          #render json: @reviews
    else
        render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
      #render json: @review
  end

  def edit #Will not need using api
      @review = Review.find_by_id(params[:id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def blank_stars
    5 - stars.to_i
  end

  private
  def review_params
         params.require(:review).permit(:stars, :title, :content, :movie_id)
  end
end
