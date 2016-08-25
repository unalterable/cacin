class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :event, foreign_key: true
      t.references :member, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
