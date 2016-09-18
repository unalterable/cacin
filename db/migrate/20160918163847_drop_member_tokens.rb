class DropMemberTokens < ActiveRecord::Migration[5.0]
  def up
    drop_table :member_tokens
  end
  def down
    create_table :member_tokens do |t|
      t.string :token
      t.references :member, foreign_key: true
      t.references :rsvp, foreign_key: true
      t.integer :times_used
      t.text :notes
      t.timestamps
    end
  end
end
