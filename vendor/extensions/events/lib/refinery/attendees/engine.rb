module Refinery
  module Events
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Events

      engine_name :refinery_events

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "attendees"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.events_admin_attendees_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/events/attendee',
            :title => 'first_name'
          }
          plugin.menu_match = %r{refinery/events/attendees(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Attendees)
      end
    end
  end
end
