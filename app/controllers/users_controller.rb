class UsersController < ApplicationController

    #users can sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do

        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and password can't be blamk"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "Username already exists"
            erb :'users/signup'
        else 
            user.save
            session[:user_id] = user.id
            redirect '/events'
        end

    end

    #users can delete account

end