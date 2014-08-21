
FactoryGirl.define do
  factory :event_category, :class => Refinery::Events::EventCategory do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

