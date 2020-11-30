class HabitsController < ApplicationController

    #INDEX
    get '/habits' do
        @habits = Habit.all #get all habits from db
        erb :"/habits/index"
    end

    #CREATE
    get '/habits/new' do
        if logged_in?
            erb :"/habits/new"
        else
            flash[:error] = "You must log in to create a new habit."
            redirect "/"
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

    post '/habits' do
        @habit = Habit.create(name: params[:name], date: params[:date], description: params[:description])
        if @habit.save
            redirect "/habits"
        else
            flash[:error] = "Please fill out all fields to create your habit."
            redirect '/habits/new'
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
        @habit.destroy
        redirect '/habits'
    end
end
