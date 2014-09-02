require 'spec_helper'

module Refinery
  module Events
    describe EventCategory do

      before { @event_category = FactoryGirl.create(:event_category, name: 'Category CMS') }

      subject { @event_category }

      it { should respond_to(:name) }
      it { should be_valid }

      it { should respond_to(:events) }

      describe "when name is not present" do
        before { @event_category.name = nil }
        it { should_not be_valid }
      end
    end
  end
end
