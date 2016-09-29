class Event < ApplicationRecord
  has_many :event_mails
  has_many :rsvps
end
