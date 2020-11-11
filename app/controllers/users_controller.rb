class UsersController < ApplicationController

    #users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do

        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/events'
        else 
            @error = "Invalid credentials"
            erb :'/users/signup'
        end
    end

    #users can delete account

end