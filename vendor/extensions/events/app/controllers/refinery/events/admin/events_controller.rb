module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        before_filter :find_all_event_categories
        before_filter :prepare_edition, :only => [:edit]

        crudify :'refinery/events/event',
                :xhr_paging => true


         def index
          respond_to do |format|
            format.html do
              search_all_events if searching?
              paginate_all_events

              render_partial_response?
            end
            format.json { @events = Event.all }
          end
        end

        def new
          @event = Refinery::Locations::Event.new()
          if params[:date] != nil
            @event.date = Date.parse(params[:date])
          end

        end

        protected
          def find_all_event_categories
            @event_categories = Refinery::Events::EventCategory.all
          end

          def prepare_edition
            @attendees = @event.attendees.to_json
          end

          def event_params
            params.require(:event).permit(:title, :description, :short_description, :event_category_id,
                          :poster_id, :background_image_id, :time_start, :time_end, :date, :end_date,
                          :street_address, :address_description, :zip, :state, :city, :telephone,
                          :email, :organizer_name, :has_signup, :limit, :email_subject, :email_body,
                          :is_published, :publish_date, :publish_time, :invite_only, :position, :attendees_ids => [])
          end

      end
    end
  end
end
