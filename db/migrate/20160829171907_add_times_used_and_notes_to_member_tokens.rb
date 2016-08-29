class AddTimesUsedAndNotesToMemberTokens < ActiveRecord::Migration[5.0]
  def change
    add_column :member_tokens, :times_used, :integer
    add_column :member_tokens, :notes, :text
  end
end
