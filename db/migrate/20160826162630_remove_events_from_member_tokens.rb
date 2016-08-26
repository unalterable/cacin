class RemoveEventsFromMemberTokens < ActiveRecord::Migration[5.0]
  def change
    remove_reference :member_tokens, :event, foreign_key: true
  end
end
