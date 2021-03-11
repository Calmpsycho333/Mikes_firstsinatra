class MoviesController < ApplicationController

  get '/movies' do 
    @movies = Movie.all
    erb :'/movies/index'
  end

  get '/movies/new' do
    redirect_if_logged_out
    erb :'/movies/new'
  end

  post '/movie' do 
    redirect_if_logged_out
    movie = Movie.new(params)
    movie.user_id = current_user.id
    if movie.save
      redirect "/movies/#{movie.id}"
    else
      @error = "Movie invalid. Try Again. Inputs required: Title and Release Date."
      erb :'movies/new'
    end
  end

  get '/movies/:id' do
    @movie = Movie.find(params[:id])
    erb :'movies/show'
  end

  #Update Routes
  get 'movies/edit/:id' do
  end

  patch 'movies/edit/:id' do
  end

  #Delete Route
  delete 'movies/:id' do
  end

end