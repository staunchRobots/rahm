class EventsAttendees < ActiveRecord::Migration
  def change
    create_table :refinery_events_events_attendees, :id => false do |t|
      t.integer :event_id
      t.integer :attendee_id
    end
  end
end
