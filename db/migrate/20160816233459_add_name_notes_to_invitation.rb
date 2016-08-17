class AddNameNotesToInvitation < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :name, :string
    add_column :invitations, :notes, :text
  end
end
