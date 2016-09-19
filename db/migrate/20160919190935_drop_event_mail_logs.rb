class DropEventMailLogs < ActiveRecord::Migration[5.0]
  def change
    drop_table :event_mail_logs
  end
end
