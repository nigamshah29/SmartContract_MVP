class CreateAssignees < ActiveRecord::Migration[5.1]
  def change
    create_table :assignees do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.integer :hourly_rate
      t.references :requirement, foreign_key: true

      t.timestamps
    end
  end
end
