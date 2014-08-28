class EventMailer < ActionMailer::Base
  default from: "info@rahm.com"

  def confirmation_email(attendee,event)
    @attendee = attendee
    @event = event

    if event.email_body.nil? or event.email_body.empty?
      mail(to: @attendee.email, subject: 'Registration event confirmation');
    else
      data = {}
      data[:attendee] = attendee
      data[:event] = event
      mail(to: attendee.email, 
        content_type: "text/html", 
        subject: 'Registration event confirmation')
    end
  end
end