module Refinery
  module Events
    class AttendeesController < ::ApplicationController

      before_filter :find_all_attendees
      before_filter :find_page
      before_filter :prepare_new

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @attendee in the line below:
        present(@page)
      end

      def new
        @attendee = Attendee.new
      end

      def show
        @event = Event.find(params[:event_id])
        
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @attendee in the line below:
        present(@page)
      end

      def create
        event_id = params[:event_id]
        event = Event.find(event_id)
        if event.limit.nil? or event.limit == 0 or event.attendees.size < event.limit
          @attendee = Attendee.find_by(:email => attendee_params[:email])
          if @attendee.nil?
            if (@attendee = Refinery::Events::Attendee.create(attendee_params)).valid?
              flash.notice = t(
                'refinery.crudify.created',
                :what => "'#{@attendee.first_name}'"
              )
              add_attendee_to_event(event, @attendee)
            else
              render :action => 'show'
            end
          else
            add_attendee_to_event(event, @attendee)
          end
        else 
          redirect_to refinery.locations_event_path(event_id), :flash => { :error => "Event is full!" }
        end
      end

      protected
        def attendee_params
          params.require(:attendee).permit(:first_name, :last_name, :email, :position, :created_at, :updated_at, :event_ids => [])
        end

        def find_all_attendees
          @attendees = Attendee.order('position ASC')
        end

        def find_page
          @page = ::Refinery::Page.where(:link_url => "/attendees").first
        end

        def prepare_new
          if (params[:event_id] != nil)
            @event_id = params[:event_id]
            event = Event.find(@event_id)
          end
        end

        def add_attendee_to_event (event, attendee)
          if (!event.nil? and !attendee.events.exists?(event.id))
            # if the event is not associated to the attendee...
            attendee.events << event
          end
          
          EventMailer.confirmation_email(attendee, event).deliver
          redirect_to refinery.events_event_path event.id
        end

    end
  end
end
