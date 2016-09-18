class RemoveMemberTokenReferencesFromEventMailLogs < ActiveRecord::Migration[5.0]
  def up
    remove_column :event_mail_logs, :member_token_id
  end

  def down
    add_reference :event_mail_logs, :member_token, foreign_key: true
  end
end
