
FactoryGirl.define do
  factory :event, :class => Refinery::Events::Event do
    sequence(:title)  { |n| "refinery#{n}" }
    date              { Date.today + rand(30) }
    publish_date      { Date.today + rand(30) }
    time_start        { Time.now }
  end
end

