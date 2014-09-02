module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_filter :find_all_events
      before_filter :find_page
      helper_method :get_availability

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

      def show
        @event = Event.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event in the line below:
        present(@page)
      end

    protected

      def find_all_events
        @events = Event.where('is_published = true and invite_only = false').order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/events").first
      end

      def get_availability(event)
        if event.limit.nil? or event.limit == 0
          return 'NA'
        else
          return event.limit - event.attendees.size;
        end
      end

    end
  end
end
