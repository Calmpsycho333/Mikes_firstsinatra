#require './config/environment'

class ApplicationController < Sinatra::Base


    configure do
        set :public_folder, "public"
        enable :sessions
        set :session_secret, "password"
        set :views, "app/views"
      end

      get '/login' do 
        erb :login
      end

      get '/' do

        erb :index 

      end 

      def current_user

        User.find(session[:user_id])
        
      end

      def logged_in?
        !!current_user
      end



end