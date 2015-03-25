# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController

  def index
    sort = params[:sort_by] || "null"
	@all_ratings = Movie.all_ratings	
	@selected_rating = params[:ratings] || {}
	case sort
	when "title"
		@movies = Movie.find(:all,:order=>"title")
		return @movies
	when "date"
		@movies = Movie.find(:all,:order=>"release_date")
		return @movies
	end
	if @selected_rating == {}
    	@movies = Movie.all
		return @movies
	end
	@movies = Movie.find_all_by_rating(@selected_rating.keys)
	
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # Look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
