
FactoryGirl.define do
  factory :attendee, :class => Refinery::Events::Attendee do
    sequence(:email) { |n| "refinery#{n}@example.com" }
  end
end

