class AddEventsToMemberTokens < ActiveRecord::Migration[5.0]
  def change
    add_reference :member_tokens, :event, foreign_key: true
  end
end
