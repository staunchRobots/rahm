module Refinery
  module Events
    module Admin
      class AttendeesController < ::Refinery::AdminController

        crudify :'refinery/events/attendee',
                :title_attribute => 'first_name',
                :xhr_paging => true

        protected
          def attendee_params
            params.require(:attendee).permit(:first_name, :last_name, :email, :position, :created_at, :updated_at, :event_ids => [])
          end
      end
    end
  end
end
