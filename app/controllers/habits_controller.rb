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
            # @current_user
            erb :"/habits/create_habit"
        else
            flash[:error] = "You must log in to create a new habit."
            redirect '/'
        end
    end

    get '/habits/:id' do
        @habit = Habits.find(params[:id])
        erb :'/habits/show_habit'
    end

    post '/habits' do
        @habit = Habits.create(params)
        if @habit.save
            redirect '/habits/#{habit.id}'
        else
            flash[:error] = "Please fill out all fields to create your habit."
            redirect '/habits/create_habit'
        end
    end 

    #READ
    get '/habits/:id' do
        @habit = Habit.find(params[:id])
        if logged_in? && @habit.user == current_user
            erb :'/habits/show_habit'
        else
            redirect '/login'
        end
    end

    #UPDATE
    get '/habits/:id/edit' do
        @habit = Habit.find(params[:id])
        if logged_in? && @habit.user == current_user
            @habit = Habit.find(params[:id])
            @user = User.find(session[:user_id])
            erb :'/habits/edit_habit'
        else
            flash[:error] = "Your are not authorized to edit this habit."
            redirect '/login'
        end
    end

    patch '/habits/:id' do
        @habit = Habit.find(params[:id])
        @habit.name = params[:name]
        @habit.date = params[:date]
        @habit.description = params[:description]
        if !@habit.save
            flash[:error] = "Please fill out all fields to update your habit."
            erb :'/habits/edit_habit'
        else
            redirect '/habits/#{@habit.id}'
        end
    end

    #DELETE
    delete '/habits/:id/delete' do
        @habit = Habit.find(params[:id])
        if logged_in? && @habit.user == current_user
            @habit.destroy
            redirect '/habits'
        else
            redirect '/login'
        end
    end
end
