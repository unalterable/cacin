class CreateMemberTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :member_tokens do |t|
      t.string :token
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
