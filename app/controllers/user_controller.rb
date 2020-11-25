class UserController < ApplicationController

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
        if !@user.save
            flash[:error] = "Invalid input, please try again."
            erb :'/users/signup'
        else
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    get '/logout' do
        if logged_in?
            # @user = current_user
            # @user = nil
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end
end
