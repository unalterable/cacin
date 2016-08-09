class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :organisation
      t.string :email

      t.timestamps
    end
  end
end
