class UsersController < ApplicationController

    get '/signup' do 
        redirect_if_logged_in
        erb :signup

    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/users/welcome'
        else
            @error = "Invalid credentials.  Please try again."
            erb :'/signup'
        end
    end

    post '/login' do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/users/welcome'
        elsif user
            @error = "Invalid password.  Please try again."
            erb :'/login'
        else
            @error = "Invalid credentials. Email is not found. Please try again."
            erb :'/login'
        end
    end

    get '/logout' do
        session.clear
        redirect "/"
    end

    get '/users/welcome' do
        if logged_in?
            @user = current_user
            @movies = "the current user's movies"
            erb :'users/welcome'
        else
            redirect '/'
        end
       
    end
    
end