class UsersController < ApplicationController

    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect 'users/#{user.id}'
        else
            flash[:error] = "Either email or password incorrect, please try again."
            redirect '/login'
        end
    end

    get '/signup' do
        erb :'/users/signup'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end
    
    post '/users' do
        @user = User.create(params)
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end
end
