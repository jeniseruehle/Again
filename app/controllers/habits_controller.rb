class HabitsController < ApplicationController

    #INDEX
    get '/habits' do
        @habits = current_user.habits
        erb :"/habits/index"
    end

    #CREATE
    get '/habits/new' do
        if logged_in?
            @current_user
            erb :"/habits/new"
        else
            flash[:error] = "You must log in to create a new habit."
            redirect "/"
        end
    end

    post '/habits' do
        @habit = current_user.habits.create(name: params[:name], date: params[:date], description: params[:description])
        if @habit.save
            redirect "/habits"
        else
            flash[:error] = "Please fill out all fields to create your habit."
            redirect '/habits/new'
        end
    end 

    #READ
    get '/habits/:id' do
        @habit = Habit.find(params[:id])
        erb :'/habits/show'
    end

    #UPDATE
    get '/habits/:id/edit' do
        @habit = Habit.find(params[:id])
        if @habit.user_id == current_user.id
            erb :'/habits/edit'
        else
            flash[:error] = "You are not authorized to edit this habit."
            redirect "/habits"
        end
    end

    patch '/habits/:id' do
        @habit = Habit.find_by_id(params[:id])
        @habit.update(name: params[:name], date: params[:date], description: params[:description])
        @habit.save
        redirect "/habits/#{@habit.id}"
    end

    #DELETE
    delete '/habits/:id/delete' do
        @habit = Habit.find(params[:id])
        if @habit && @habit.user == current_user
            @habit.destroy
            redirect '/habits'
        else 
            redirect "/"
        end
    end
end
