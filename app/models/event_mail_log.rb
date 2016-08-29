class EventMailLog < ApplicationRecord
  belongs_to :event_mail
  belongs_to :member
  belongs_to :member_token
end
