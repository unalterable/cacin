class Rsvp < ApplicationRecord
  belongs_to :event
  belongs_to :member

  before_create { self.status = 'Unanswered'}

end
