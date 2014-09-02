require 'spec_helper'

module Refinery
  module Events
    describe Event do

      before { @event = FactoryGirl.create(:event, title: 'Refinery CMS') }

      subject { @event }

      it { should respond_to(:title) }
      it { should be_valid }

      describe "when title is not present" do
        before { @event.title = nil }
        it { should_not be_valid }
      end
    
      describe "relationships" do
        let(:category) { FactoryGirl.create(:event_category, name: 'Example Category') }
        before { @event.event_category_id = category.id }

        it 'Should assign a category to the event' do
          expect(@event.event_category.name).to eq(category.name)
        end
      end
    end
  end
end
