require 'spec_helper'

describe Refinery do 
  describe "Events" do
    describe "events" do
      refinery_login_with :refinery_user
      
      describe "events list" do
        before do
          FactoryGirl.create(:event, :title => "Event1")
          FactoryGirl.create(:event, :title => "Event2")
        end

        it "shows two items" do
          visit refinery.events_events_path
          page.should have_content("Event1")
          page.should have_content("Event1")
        end
      end
    end
  end
end