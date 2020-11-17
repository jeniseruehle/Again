class UserController < ApplicationController

    get '/signup' do
        # if logged_in?
        #     redirect "/habits"
        # else
            erb :'users/create_user'
        # end
    end
    
    post '/signup' do
        @user = User.new(email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end
    
    get '/login' do
        erb :login
    end

    post '/login' do
        #authenticate my user
        #log in
        #redirect to user account
        #error message if fail to login
        #redirect to login
    end

    get '/logout' do

    end
end
