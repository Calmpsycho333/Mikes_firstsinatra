class MoviesController < ApplicationController

  get '/movies' do 
    @movies = Movie.all
    erb :'/movies/index'
  end

  get '/movies/new' do
    #redirect_if_logged_out
    erb :'/movies/new'
  end

  post '/movie' do 

    movie = Movie.new(params)
    if movie.save
    end
        

  end
end