class AddSentAndIncludesRsvpToEventMail < ActiveRecord::Migration[5.0]
  def change
    add_column :event_mails, :sent, :boolean
    add_column :event_mails, :includes_rsvp, :boolean
  end
end
