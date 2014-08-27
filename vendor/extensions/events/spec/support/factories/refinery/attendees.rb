
FactoryGirl.define do
  factory :attendee, :class => Refinery::Events::Attendee do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

