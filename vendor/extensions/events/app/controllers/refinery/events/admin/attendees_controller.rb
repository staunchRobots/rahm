module Refinery
  module Events
    module Admin
      class AttendeesController < ::Refinery::AdminController

        before_filter :prepare_new

        crudify :'refinery/events/attendee',
                :title_attribute => 'first_name',
                :xhr_paging => true

        def index
          @event = Event.find(params[:event_id])
          respond_to do |format|
            format.csv { send_data @event.attendees.to_csv }
          end
        end

        def create
          @attendee = Attendee.find_by(:email => attendee_params[:email])
          if @attendee.nil?
            if (@attendee = Refinery::Events::Attendee.create(attendee_params)).valid?
              flash.notice = t(
                'refinery.crudify.created',
                :what => "'#{@attendee.first_name}'"
              )
              create_or_update_successful
            else
              create_or_update_unsuccessful 'new'
            end
          else
            if @attendee.update_attributes(attendee_params)
              flash.notice = t(
                'refinery.crudify.updated',
                :what => "'#{@attendee.first_name}'"
              )
              create_or_update_successful
            else
              create_or_update_unsuccessful 'edit'
            end
          end
        end

        def create_or_update_successful
          event_id = params[:event_id]
          if params[:event_id]
            # if the event is not associated to the attendee...
            event = Event.find(event_id)
            if (!@attendee.events.exists?(event_id))
              @attendee.events << event
            end

            if params[:notification] == 'true'
              EventMailer.confirmation_email(@attendee, event).deliver
            end
            respond_to do | format |
              format.html {redirect_to edit_events_admin_event_path(event_id)}
              format.json {render json: @attendee}
            end
          else 
            respond_to do | format |
              format.html {redirect_to events_admin_attendees_path}
              # Enables json calls
              format.json {render json: @attendee}
            end
          end
        end

        def destroy
          # object gets found by find_attendee function
          title = @attendee.first_name
          if @attendee.destroy
            flash.notice = t('destroyed', :scope => 'refinery.crudify', :what => "'#{title}'")
          end
          respond_to do | format |
            format.html {redirect_to redirect_url}
            # Enables json calls
            format.json {render json: @attendee}
          end
        end

        protected
          def attendee_params
            params.require(:attendee).permit(:first_name, :last_name, :email, :position, :created_at, :updated_at, :event_ids => [])
          end

          def prepare_new
            if(params[:event_id] != nil)
              @event_id = params[:event_id]
              event = Event.find(@event_id)
              # @signup_fields = event.signup_fields.to_json
            end
          end
      end
    end
  end
end
