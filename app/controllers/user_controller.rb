class UserController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/habits"
        else
            erb :'users/create_user'
        end
    end
    
    post '/signup' do

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





end
