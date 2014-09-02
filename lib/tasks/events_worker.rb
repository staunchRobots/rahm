require 'httparty'

puts "Starting event_publish at #{Time.now}"
puts HTTParty.get "http://rahm.herokuapp.com/recurrent_jobs/event_publish.json"
puts "event_publish completed at #{Time.now}"
puts "Starting event_reminder at #{Time.now}"
puts HTTParty.get "http://rahm.herokuapp.com/recurrent_jobs/event_reminder.json"
puts "event_reminder completed at #{Time.now}"