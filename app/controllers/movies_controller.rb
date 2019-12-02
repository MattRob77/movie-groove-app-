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
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movie_path(@movie)
    else
        @movie.build_genre
      render :new
    end
end

private

  def movie_params
    params.require(:movie).permit(:name, :description, :user_id, :genre_id, genre_attributes: [:name])
  end
end
