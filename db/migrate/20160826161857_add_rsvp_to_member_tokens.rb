class AddRsvpToMemberTokens < ActiveRecord::Migration[5.0]
  def change
    add_reference :member_tokens, :rsvp, foreign_key: true
  end
end
