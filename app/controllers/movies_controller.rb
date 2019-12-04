class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @movie.build_genre
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      redirect_to movies_path
    else
        @movie.build_genre
      render :new
    end
  end

  def ratings
    @movies = Movie.grouped_ratings #gives access to scope method 
  end

private

  def movie_params
    params.require(:movie).permit(:name, :description, :user_id, :genre_id, genre_attributes: [:name])
  end
end
