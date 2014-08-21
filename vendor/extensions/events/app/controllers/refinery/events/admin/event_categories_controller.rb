module Refinery
  module Events
    module Admin
      class EventCategoriesController < ::Refinery::AdminController

        crudify :'refinery/events/event_category',
                :title_attribute => 'name',
                :xhr_paging => true

        protected

          def event_category_params
            params.require(:event_category).permit(:name, :position)
          end

      end
    end
  end
end
