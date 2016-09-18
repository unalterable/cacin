class MoveTokenAndNotesToMember < ActiveRecord::Migration[5.0]
  def up
    add_column :members, :token, :string
    add_column :members, :notes, :text, null: false, default: ""
    Member.all.each do |member|
      if member.member_tokens.last
        member.update(token: member.member_tokens.last.token)
        member.update(notes: member.member_tokens.last.notes || "")
        member.add_notes("Transferred in migration from MemberToken ##{member.member_tokens.last.id}")
      else
        member.update(token: Member.gen_unique_token)
        member.add_notes("Created in migration. Member didn't have a MemberToken")
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
