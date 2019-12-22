class MoviesController < ApplicationController
  #before_action :find_movie, only:[:show, :update, :destroy]
  #Rails API in comments

  def index
    @movies = Movie.all
    #render json: @movies
  end

  def new #Will not need using api
    @movie = Movie.new
    @movie.build_genre #Build/another word for new object
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movies_path
    else
        @movie.build_genre #Build/another word for new object
      render :new
    end
  end

  def ratings
    @movies = Movie.grouped_ratings #gives access to scope method
  end

  def destroy

  end

private

  def movie_params
    params.require(:movie).permit(:name, :description, :user_id, :genre_id, genre_attributes: [:name]) #schema
  end
end
