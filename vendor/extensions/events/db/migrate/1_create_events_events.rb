class CreateEventsEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events do |t|
      t.string :title
      t.text :description
      t.text :short_description
      t.integer :event_category_id
      t.integer :poster_id
      t.integer :background_image_id
      t.time :time_start
      t.time :time_end
      t.date :date
      t.date :end_date
      t.string :street_address
      t.string :address_description
      t.string :zip
      t.string :state
      t.string :city
      t.string :telephone
      t.string :email
      t.string :organizer_name
      t.boolean :has_signup
      t.integer :limit
      t.string :email_subject
      t.text :email_body
      t.boolean :is_published
      t.date :publish_date
      t.time :publish_time
      t.boolean :invite_only
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

  end

end
