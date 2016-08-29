class CreateEventMails < ActiveRecord::Migration[5.0]
  def change
    create_table :event_mails do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.string :from
      t.text :html_template
      t.text :plain_text_template

      t.timestamps
    end
  end
end
