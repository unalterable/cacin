class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :event, foreign_key: true
      t.text :html
      t.text :plain_text

      t.timestamps
    end
  end
end
