class UsersController < ApplicationController

    get '/signup' do 

        erb :signup

    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect 'user/welcome'
        else
            @error = "Invalid credentials.  Please try again."
            erb :'/signup'
        end
    end

    get 'users/welcome' do
        if logged_in?
            @user = current_user
            @movies = "the current user's movies"
            erb :'users/welcome'
        else
            redirect '/'
        end
       
    end
    
end