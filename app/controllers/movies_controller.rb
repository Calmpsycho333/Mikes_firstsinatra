class MoviesController < ApplicationController

  get '/movies/index' do 

  end

  get '/movies/new' do

  end

  post '/movie' do 

    movie = Movie.new(params)
    if movie.save
    end
        

  end
end