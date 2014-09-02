class RecurrentJobsController < ApplicationController
  def event_publish
    events = Refinery::Events::Event.where(:is_published => false)
    events.each do |event|
      if !event.invite_only && event.publish_date == DateTime.now.to_date
        event.is_published = true
        event.save
      end
    end
    respond_to do | format |
      format.json {render json: true}
    end
  end
end