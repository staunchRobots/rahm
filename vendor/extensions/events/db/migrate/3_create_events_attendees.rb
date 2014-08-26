class CreateEventsAttendees < ActiveRecord::Migration

  def up
    create_table :refinery_events_attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/attendees"})
    end

    drop_table :refinery_events_attendees

  end

end
