class UserController < ApplicationController

    get '/signup' do
        if !session[:user_id]
            erb :'users/create_user'
        else
            redirect '/habits'
        end
    end
    
    post '/signup' do
        @user = User.new(email: params[:email], password: params[:password])
        if !@user.save
            #error msg
            erb :'users/create_user'
        else
            session[:user_id] = @user.id
            redirect '/habits'
        end
    end
    
    get '/login' do
        if !session[:user_id]
            erb :'users/login'
        else
            redirect '/habits'
        end
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/habits'
        else
            #error msg
            erb :'users/login'
        end
    end

    get '/logout' do
        if logged_in?
            @user = current_user
            @user = nil
            session.destroy
            redirect '/'
        else
            redirect '/'
        end
    end
end
