require 'spec_helper'

module Refinery
  module Events
    describe Attendee do
      before { @attendee = FactoryGirl.create(:attendee, email: 'example@example.com') }

      subject { @attendee }

      it { should respond_to(:email) }
      it { should respond_to(:first_name) }
      it { should respond_to(:last_name) }
      it { should respond_to(:events) }

      it { should be_valid }

      describe "when email is not present" do
        before { @attendee.email = nil }
        it { should_not be_valid }
      end

      describe "with blank email" do
        before { @attendee.email = " " }
        it { should_not be_valid }
      end

      describe "relationship" do 
        let(:event) { FactoryGirl.create(:event) }
        let(:attendee2) { FactoryGirl.create(:attendee, email: 'attendee2@example.com') }
        
        it "associate multiple attendees to an event" do
          @attendee.events << event
          attendee2.events << event

          expect(event.attendees[0].email).to eq 'example@example.com'
          expect(event.attendees[1].email).to eq 'attendee2@example.com'
          expect(event.attendees.count).to eq(2)
        end
      end
    end
  end
end
