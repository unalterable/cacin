class AddPriorityToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :priority, :string
  end
end
