class DropInvitations < ActiveRecord::Migration[5.0]
  def up
    drop_table :invitations
  end

  def down
    create_table :invitations
  end
end
