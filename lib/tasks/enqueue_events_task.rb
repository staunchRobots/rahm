# exec this file with:  ruby enqueue_events_task
# for scheduling the task

require 'iron_worker_ng'
require 'active_support/time'
client = IronWorkerNG::Client.new

schedule = client.schedules.create('events', {}, 
  {
    :start_at => (DateTime.now + 1).midnight, 
    :run_every => 86400
  })

puts schedule.id