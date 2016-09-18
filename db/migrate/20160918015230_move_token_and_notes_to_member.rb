class MoveTokenAndNotesToMember < ActiveRecord::Migration[5.0]
  def up
    add_column :members, :token, :string
    add_column :members, :notes, :text
    Member.all.each do |member|
      if member.member_tokens.first
        member.update(token: member.member_tokens.first.token)
        member.update(notes: member.member_tokens.first.notes)
      end
    end
  end

  def down
    Member.all.each do |member|
      MemberToken.find_or_create_by(member: member, token: member.token).update(notes: member.notes)
    end
    remove_column :members, :token, :string
    remove_column :members, :notes, :text
  end
end
