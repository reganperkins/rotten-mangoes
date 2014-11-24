class MoviesController < ApplicationController
  def index
    @movies = Movies.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movies = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = MOvie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end

end
