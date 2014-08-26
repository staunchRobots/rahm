module Refinery
  module Events
    class Attendee < Refinery::Core::BaseModel


      validates :first_name, :presence => true, :uniqueness => true

      has_and_belongs_to_many :events

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
