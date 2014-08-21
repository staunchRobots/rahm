module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        before_filter :find_all_event_categories

        crudify :'refinery/events/event',
                :xhr_paging => true

        protected
          def find_all_event_categories
            @event_categories = Refinery::Events::EventCategory.all
          end

          def event_params
            params.require(:event).permit(:title, :description, :short_description, :event_category_id,
                          :poster_id, :background_image_id, :time_start, :time_end, :date, :end_date,
                          :street_address, :address_description, :zip, :state, :city, :telephone,
                          :email, :organizer_name, :has_signup, :limit, :email_subject, :email_body,
                          :is_published, :publish_date, :publish_time, :invite_only, :position)
          end

      end
    end
  end
end
