class AddSubjectToEventMail < ActiveRecord::Migration[5.0]
  def change
    add_column :event_mails, :subject, :string
  end
end
