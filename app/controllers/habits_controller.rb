class HabitsController < ApplicationController

    #INDEX
    get '/habits' do
        if logged_in?
            @habits = Habit.all
            erb :"/habits/habits"
        else
            redirect '/login'
        end
    end

    #CREATE
    get '/habits/new' do
        if logged_in?
            erb :"/habits/create_habit"
        else
            flash[:error] = "You must log in to create a new habit."
            redirect '/'
        end
    end

    post '/habits' do
        @habit = Habit.create(params)
        if @habit.save
            redirect '/habits/#{habit.id}'
        else
            flash[:error] = "Please fill out all fields to create your habit."
            redirect '/habits/create_habit'
        end
    end 

    #READ
    get '/habits/:id' do
        if !logged_in?
            redirect '/login'
        else
            @habit = Habit.find(params[:id])
            erb :'/habits/show_habit'
        end
    end

    #UPDATE
    get '/habits/:id/edit' do
        @habit = Habit.find(params[:id])
        if !permission?(@habit)
            flash[:error] = "Your are not authorized to edit this habit."
            redirect '/habits'
        else
            erb :'/habits/edit_habit'
        end
    end

    patch '/habits/:id' do
        @habit = Habit.find(params[:id])
        @habit.update(name: params[:name], date: params[:date], description: params[:description])
        redirect '/habits/#{@habit.id}'
    end

    #DELETE
    delete '/habits/:id/delete' do
        @habit = Habit.find(params[:id])
        @habit.destroy
        redirect '/habits'
    end
end
