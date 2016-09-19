class MoveEventMailLogsIntoEventMail < ActiveRecord::Migration[5.0]
  def up
    add_column :event_mails, :yaml_logs, :text
    EventMail.all.each do |event_mail|
      yaml_logs = EventMailLog.where(event_mail: event_mail).map do |log|
        {date: log.created_at, member_id: log.member_id, email: log.member.email}
      end.to_yaml
      event_mail.update( yaml_logs: yaml_logs )
    end
  end

  def down
    EventMail.all.each do |event_mail|
      YAML.load(event_mail.yaml_logs).each do |log|
        EventMailLog.find_or_create_by( member_id: log[:member_id],
                                        event_mail: event_mail
                                      )
      end
    end
    remove_column :event_mails, :yaml_logs
  end
end
