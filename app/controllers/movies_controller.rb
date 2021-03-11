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
  get '/movies/edit/:id' do
    redirect_if_logged_out
    @movie = Movie.find(params[:id])
    redirect_if_not_owner(@movie)
    erb :'/movies/edit'
  end

  patch '/movies/edit/:id' do
    redirect_if_logged_out
    movie = Movie.find(params[:id])
    redirect_if_not_owner(movie)
    data = {
      title: params[:title],
      description: params[:description],
      genre: params[:genre],
      release_year: params[:release_year],
    }
     if movie.update(data)
      redirect "/movies/#{movie.id}"
     else
      @error = "Invalid movie edit."
      redirect :"/movies/edit/#{movie.id}"
     end
  end

  #Delete Route
  delete '/movies/:id' do
    redirect_if_logged_out
    movie = Movie.find(params[:id])
    redirect_if_not_owner(movie)
    if movie.destroy
      redirect '/movies'
    else
      @error = "Invalid delete"
      redirect "/movies/#{movie.id}"
    end
  end

  def redirect_if_not_owner(movie)
    if !(movie.user_id == current_user.id)
      redirect '/movies'
    end
  end

end