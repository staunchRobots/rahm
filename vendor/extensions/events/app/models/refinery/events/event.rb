module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'


      validates :title, :presence => true, :uniqueness => true

      belongs_to :poster, :class_name => '::Refinery::Image'

      belongs_to :background_image, :class_name => '::Refinery::Image'

      belongs_to :event_category

      has_and_belongs_to_many :attendees

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      #   acts_as_indexed :fields => [:title]

    end
  end
end
