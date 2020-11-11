class EventsController < ApplicationController

    # CREATE 

        # New 
        #make a get request to '/events/new'
        get '/events/new' do 
            erb :'/events/new'
        end

        #Create
        #make a post request to '/events'
        post '/events' do
            event = Event.new(params)
            if !event.title.empty? && !event.date.empty?
                event.save
                redirect '/events'
            else
                @error = "Data invalid. Please try again."
                erb :'events/new'
            end
        end

    #READ
         #index
            #make a get request to '/events'

        get '/events' do 
            @events = Event.all.reverse
            erb :'events/index'
        end

        #show
            #make a get request to '/events/:id'

        get '/events/:id' do 
            @event = Event.find(params[:id])
            erb:'events/show'
        end


    #UPDATE

        # Edit
            #make a get reqest to '/events/:id/edit'
            get '/events/:id/edit' do
                @event = Event.find(params[:id])
                erb :'/events/edit'
            end

        #Update
            #make a patch request to '/events/:id'
            patch '/events/:id' do
                @event = Event.find(params[:id])
                if !params["event"]["title"].empty? && !params["event"]["date"].empty?
                   @event.update(params["event"])
                    redirect "/events/#{params[:id]}"
                else
                    @error = "Data invalid. Please try again."
                    erb :'events/edit'
                end


                event.update(title: params["title"], date: params["date"], address: params["address"], image: params["image"])

            end

    #DESTROY

        #make a delete request to '/events/:id'
        delete '/events/:id' do
            event = Event.find(params[:id])
            event.destroy
            redirect '/events'
        end

end