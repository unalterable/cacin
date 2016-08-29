class CreateEventMailLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :event_mail_logs do |t|
      t.references :event_mail, foreign_key: true
      t.references :member, foreign_key: true
      t.references :member_token, foreign_key: true

      t.timestamps
    end
  end
end
