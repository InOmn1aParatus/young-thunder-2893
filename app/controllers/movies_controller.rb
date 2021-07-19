class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    if params[:name].present?
      @actors = Actor.where("lower(name) LIKE ?", "%#{params[:name].downcase}%")
    else
      @actors = Actor.order(age: :desc)
      # Could not finish search functionality
    end
  end

  def update
    @movie = Movie.find(params[:id])

  end
end