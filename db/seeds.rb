Event.destroy_all

puts "seeding database...."
Eventbrite::Adapter.new.fetch_events
puts "Done"
