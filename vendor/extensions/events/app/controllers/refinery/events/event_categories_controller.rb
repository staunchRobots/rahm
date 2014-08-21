module Refinery
  module Events
    class EventCategoriesController < ::ApplicationController

      before_filter :find_all_event_categories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event_category in the line below:
        present(@page)
      end

      def show
        @event_category = EventCategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @event_category in the line below:
        present(@page)
      end

    protected

      def find_all_event_categories
        @event_categories = EventCategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/event_categories").first
      end

    end
  end
end
