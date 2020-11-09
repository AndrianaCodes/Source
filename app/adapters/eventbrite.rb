module Eventbrite

    class Adapter

        
        BASE_URL = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=US&apikey=wCcJsSQZE6qdlw0TJEekFL6WxACXmmiu"


        def fetch_events

            events = JSON.parse(RestClient.get(BASE_URL))

            events.each do |event|
            @event = Event.new
            #(title: event["name"])


            @event.save
            end

        end
    end
end