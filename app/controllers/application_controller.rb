#require './config/environment'

class ApplicationController < Sinatra::Base


    configure do
        set :public_folder, "public"
        enable :sessions
        set :session_secret, "password"
        set :views, "app/views"
      end

      get '/login' do
        redirect_if_logged_in 
        erb :login
      end

      get '/' do
        redirect_if_logged_in
        erb :index 

      end 

      def current_user

        @current_user ||= User.find(session[:user_id])
        
      end

      def logged_in?
        !!session[:user_id]
      end

      def redirect_if_logged_in
        if logged_in?
          redirect '/users/welcome'
        end

      end

end