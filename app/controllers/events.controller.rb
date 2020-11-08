class EventsController < ApplicationController

    # CREATE 

        # New 
        #make a get request to '/events/new'

        #Create
        #make a post request to '/events'

    #READ
         #index
            #make a get request to '/events'

        get '/events' do 
            erb :'events/index'
        end

        #show
            #make a get request to '/events/:id'


    #UPDATE

        # Edit
            #make a get reqest to '/events/:id/edit'

        #Update
            #make a patch request to '/events/:id'

    #DESTROY

        #make a delete request to '/events/:id'

end