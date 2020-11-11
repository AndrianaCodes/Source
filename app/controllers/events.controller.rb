class EventsController < ApplicationController

    # CREATE 

        # New 
        #make a get request to '/events/new'
        get '/events/new' do 
            if  logged_in?
                erb :'/events/new'
            else 
                redirect '/login'
            end
        end

        #Create
        #make a post request to '/events'
        post '/events' do
            filtered_params = params.reject{|key, value| key == "image" && value.empty?}
            event = current_user.events.build(filtered_params)
            event.image = nil if event.image.empty?
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
            if  logged_in?
                @events = Event.all.reverse
                erb :'events/index'
            else 
                redirect '/login'
            end
        end

        #show
            #make a get request to '/events/:id'

        get '/events/:id' do 
            if  logged_in?
                @event = Event.find(params[:id])
                erb:'events/show'
            else
                redirect '/login'
            end
        end


    #UPDATE

        # Edit
            #make a get reqest to '/events/:id/edit'
            get '/events/:id/edit' do
                if  logged_in?
                    @event = Event.find(params[:id])
                    erb :'/events/edit'
                else 
                    redirect '/login'
                end
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