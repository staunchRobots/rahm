module Refinery
  module Events
    class EventCategory < Refinery::Core::BaseModel


      validates :name, :presence => true, :uniqueness => true

      has_many :events

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
