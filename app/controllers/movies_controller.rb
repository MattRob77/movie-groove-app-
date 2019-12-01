class MoviesController < ApplicationController

  def index
    @movies = Movies.all
  end

  def new
    @movie = Movie.new
    @movie.build_genre
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      @movie.build_genre
      render :new
    end
end

private

  def movie_params
    params.require(:movie).permit(:name, :description, :user_id)
  end
end
